import { doc, getDoc, addDoc, collection, getFirestore, query, where, getDocs } from "firebase/firestore";
import Adopt from "../models/adopt.model";
import firebaseApp from "../config/firebase";

const db = getFirestore(firebaseApp);

export const addAdopt = async (
    adoptData: Adopt
) => {
    const adopt = doc(db, "adopts", adoptData.ownerUsername);
    const data = await getDoc(adopt);
    if (data.exists()) {
        throw new Error("Adopt already exists");
    } else {
        await addDoc(collection(db, "adopts"), adoptData);
    }
};

export const isAdopted = async (petId: string, donorUsername: string) => {
    const adoptionsCollectionRef = collection(db, "adopts");
    const adoptsQuery = query(
        adoptionsCollectionRef,
        where("donorUsername", "==", donorUsername),
        where("petId", "==", petId)
      );
    const adoptsQuerySnapshot = await getDocs(adoptsQuery);
    return adoptsQuerySnapshot.docs.length > 0;
}

export const getAdopter = async (petId: string) => {
    const adoptionsCollectionRef = collection(db, "adopts");
    const adoptsQuery = query(  
        adoptionsCollectionRef,
        where("petId", "==", petId)
      );
    const adoptsQuerySnapshot = await getDocs(adoptsQuery);
    const data =  adoptsQuerySnapshot.docs.map((doc) => doc.data());
    if(data.length === 0) {
        return null;
    }
    const donorUsername = data[0].donorUsername;
    const donorCollectionRef = collection(db, "donors");
    const donorQuery = query(
        donorCollectionRef,
        where("username", "==", donorUsername)
      );
    const donorQuerySnapshot = await getDocs(donorQuery);
    return donorQuerySnapshot.docs[0].data();
}
