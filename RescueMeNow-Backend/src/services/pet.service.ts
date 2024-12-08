import firebaseApp from "../config/firebase";
import {
  getFirestore,
  addDoc,
  collection,
  query,
  where,
  getDocs,
  doc,
  updateDoc,
} from "firebase/firestore";
import Pet from "../models/pet.model";
import axios from "axios";
import { json } from "body-parser";

const db = getFirestore(firebaseApp);

export const createPet = async (petData: Pet) => {
  const petDocRef = collection(db, "pets");
  const petDoc = await addDoc(petDocRef, petData);
  return petDoc;
};

export const getPetsByUsername = async (username: string) => {
  const petsCollectionRef = collection(db, "pets");
  const petsQuery = query(
    petsCollectionRef,
    where("ownerUsername", "==", username)
  );
  const petsQuerySnapshot = await getDocs(petsQuery);
  return petsQuerySnapshot.docs[0].data();
};

export const updatePet = async (petData: Pet) => {

  

  /// ***************************  model implementation  ************************

  // let label = "";
  // axios.post("http://localhost:5000/pet", /* Pass Your Model Inputs */).then((res) => {
  //   label = res.data.label; // Get the label from the response
  // }).catch((err) => {
  //   console.log(err);
  // });

  // petData.label = label; // Set the label to the petData
  /// ***************************  model implementation  ************************

  console.log("come");
  
  let label = "";
  const payload = {
    Age: 40,
    Medicines: 90,
    Food: 90,
    Monitory: 2,
    Breed: 'Mixed Breed',
    Sex: 'Female',
    "Vaccinations Status": 'Yes'
  };
  
  const url = 'http://127.0.0.1:9090/predict';
  
  await axios.post(url, payload, {
    headers: {
      'Content-Type': 'application/json'
    }
  })
  .then(response => {
    label = response.data.Predictions;
    console.log('Response:', response.data);
  })
  .catch(error => {
    console.error('Error:', error);
  });
  

  petData.label = label;
  console.log(petData.label);


  const petsCollectionRef = collection(db, "pets");
  const petsQuery = query(
    petsCollectionRef,
    where("ownerUsername", "==", petData.ownerUsername)
  );
  const petsQuerySnapshot = await getDocs(petsQuery);
  const petDoc = doc(db, "pets", petsQuerySnapshot.docs[0].id);
  const data = await updateDoc(petDoc, petData as any);
  return data;
  
  return label
};

export const getPetsByStatus = async (status: string) => {
  const petsCollectionRef = collection(db, "pets");
  const petsQuery = query(
    petsCollectionRef,
    where("isVerified", "==", status == "true" ? true : false),
  );
  const petsQuerySnapshot = await getDocs(petsQuery);
  console.log(petsQuerySnapshot.docs.map((doc) => doc.data()));

  if (petsQuerySnapshot.docs.length == 0) {
    return [];
  }
  
  return petsQuerySnapshot.docs.map((doc) => doc.data());
};

export const getPetOwnerByUsername = async (username: string) => {
  const petsCollectionRef = collection(db, "petOwners");
  const petsQuery = query(
    petsCollectionRef,
    where("username", "==", username)
  );
  const petsQuerySnapshot = await getDocs(petsQuery);
  return petsQuerySnapshot.docs[0].data();
}

export const getPetsByPublishStatus = async (status: string) => {
  const petsCollectionRef = collection(db, "pets");
  const petsQuery = query(
    petsCollectionRef,
    where("isVerified", "==", status == "true" ? true : false),
    where("isPublished", "==", status == "true" ? true : false)
  );
  const petsQuerySnapshot = await getDocs(petsQuery);
  console.log(petsQuerySnapshot.docs.map((doc) => doc.data()));
  
  return petsQuerySnapshot.docs.map((doc) => doc.data());
};
