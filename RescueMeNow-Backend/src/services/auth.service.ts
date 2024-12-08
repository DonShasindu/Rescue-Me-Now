import firebaseApp from "../config/firebase";
import {
  doc,
  getDoc,
  getFirestore,
  addDoc,
  collection,
  query,
  where,
  getDocs,
} from "firebase/firestore";

const db = getFirestore(firebaseApp);

export const loginUser = async (username: string, password: string) => {
  const usersCollectionRef = collection(db, "users");
  const userQuery = query(
    usersCollectionRef,
    where("username", "==", username)
  );
  const userQuerySnapshot = await getDocs(userQuery);
console.log(userQuerySnapshot.docs[0].data());

  if (
    !userQuerySnapshot.empty &&
    userQuerySnapshot.docs[0].data().password === password
  ) {
    const data = userQuerySnapshot.docs[0];
    let roleData;
    switch (data.data().role) {
      case "donor":
        const donorDocRef = collection(db, "donors");
        const donorQuery = query(
            donorDocRef,
            where("username", "==", username)
          );
        const donorDocSnapshot = await getDocs(donorQuery);
        return donorDocSnapshot.docs[0].data();
      case "petOwner":
        const petOwnerDocRef = collection(db, "petOwners");
        const petOwnerQuery = query(
            petOwnerDocRef,
            where("username", "==", username)
          );
        const petOwnerDocSnapshot = await getDocs(petOwnerQuery);
        return petOwnerDocSnapshot.docs[0].data();
      case "vet":
        const vetDocRef = collection(db, "vets");
        const vetQuery = query(
            vetDocRef,
            where("username", "==", username)
          );
        const vetDocSnapshot = await getDocs(vetQuery);
        return vetDocSnapshot.docs[0].data();
      default:
        console.log("Invalid role");
        throw new Error("Invalid role");
    }
  } else {
    console.log("User not found");
    throw new Error("User not found");

  }
};

export const signUpUser = async (
  userData: any
) => {
  const user = doc(db, "users", userData.username);
  const data = await getDoc(user);
  if (data.exists()) {
    throw new Error("User already exists");
  } else {
    await addDoc(collection(db, "users"), {
      username: userData.username,
      password: userData.password,
      role: userData.role,
    });
    switch (userData.role) {
      case "donor":
        await addDoc(collection(db, "donors"), {
          username: userData.username,
          password: userData.password,
          address: userData.address,
          cityName: userData.cityName,
          contactNumber: userData.contactNumber,
          donateType: userData.donateType,
          role: 'donor',
        });
        break;
      case "petOwner":
        await addDoc(collection(db, "petOwners"), {
          username: userData.username,
          address: userData.address,
          cityName: userData.cityName,
          contactNumber: userData.contactNumber,
          account: userData.account,
          role: 'petOwner',
        });
        await addDoc(collection(db, "pets"), {
          ownerUsername: userData.username,
          regId: '',
          name: '',
          age: 0,
          weight: 0,
          breed: '',
          gender: '',
          food: 0,
          medicine: 0,
          money: 0,
          description: '',
          image: '',
          isVerified: false,
          isPublished: false,
          vaccined: 'no',
          category: '',
          label: '',
          foodPercentage: 0,
          medicinePercentage: 0,
          moneyPercentage: 0,
        });
        break;
      case "vet":
        await addDoc(collection(db, "vets"), {
          username: userData.username,
          address: "",
          cityName: "",
          phoneNumber: "",
          vetName: "",
          vetType: "",
          vetAge: 0,
          vetGender: "",
          vetBreed: "",
          vetWeight: 0,
          role: 'vet',
        });
        break;
      default:
        throw new Error("Invalid role");
    }
  }
};

export const forgotPassword = async (contactNumber: string) => {
  try{
    const donorsCollectionRef = collection(db, "donors");
  const donorQuery = query(
    donorsCollectionRef,
    where("contactNumber", "==", contactNumber)
  );
  const donorQuerySnapshot = await getDocs(donorQuery);
  if (!donorQuerySnapshot.empty) {
    return donorQuerySnapshot.docs[0].data().password;
  } else {
    const petOwnersCollectionRef = collection(db, "petOwners");
    const petOwnerQuery = query(
      petOwnersCollectionRef,
      where("contactNumber", "==", contactNumber)
    );
    const petOwnerQuerySnapshot = await getDocs(petOwnerQuery);
    if (!petOwnerQuerySnapshot.empty) {
      return petOwnerQuerySnapshot.docs[0].data().password;
    } else {
      const vetsCollectionRef = collection(db, "vets");
      const vetQuery = query(
        vetsCollectionRef,
        where("contactNumber", "==", contactNumber)
      );
      const vetQuerySnapshot = await getDocs(vetQuery);
      if (!vetQuerySnapshot.empty) {
        return vetQuerySnapshot.docs[0].data().password;
      } else {
        return "User not found";
      }
    }
  }
  }catch(e){
    console.log(e);
    
  }
}
