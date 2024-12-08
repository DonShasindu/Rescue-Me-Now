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
import Donation from "../models/donation.model";
import Donor from "../models/donator.model";

const db = getFirestore(firebaseApp);

export const createDonation = async (donationData: Donation) => {
  const donationDocRef = collection(db, "donations");
  const donationDoc = await addDoc(donationDocRef, donationData);
  return donationDoc;
};

export const getDonationsByOwnerUsername = async (username: string) => {
  const donationsCollectionRef = collection(db, "donations");
  const donationsQuery = query(
    donationsCollectionRef,
    where("ownerUsername", "==", username)
  );
  const donationsQuerySnapshot = await getDocs(donationsQuery);
  return donationsQuerySnapshot.docs.map((doc) => doc.data());
};

export const getDonationsByDonorUsername = async (username: string) => {
  const donationsCollectionRef = collection(db, "donations");
  const donationsQuery = query(
    donationsCollectionRef,
    where("ownerUsername", "==", username)
  );
  const donationsQuerySnapshot = await getDocs(donationsQuery);
  return donationsQuerySnapshot.docs.map((doc) => doc.data());
};

export const getDonationsByDay = async (username: string, donorUsername: string) => {
  const donationsCollectionRef = collection(db, "donations");
  const donationsQuery = query(
    donationsCollectionRef,
    where("ownerUsername", "==", username),
    where("donorUsername", "==", donorUsername)
  );
  const donationsQuerySnapshot = await getDocs(donationsQuery);
  const docs = donationsQuerySnapshot.docs.map((doc) => doc.data());
  let total = { food: 0, medicine: 0, money: 0 };
  try {
    console.log(docs.length);

    for (let i = 0; i < docs.length; i++) {
      console.log(docs[i]);

      total.food += docs[i].food;
      total.medicine += docs[i].medicine;
      total.money += docs[i].money;
    }
  } catch (e) {
    console.log(e);
  }
  return total;
};

export const getDonationsBanners = async (username:string) => {
  const donationsCollectionRef = collection(db, "donations");
  const donationsQuery = query(
    donationsCollectionRef,
    where("ownerUsername", "==", username),
    where("isDismissed", "==", false)
  );
  const donationsQuerySnapshot = await getDocs(donationsQuery);
  const docs = donationsQuerySnapshot.docs.map((doc) => doc.data());
  return docs;
};

export const dismissBanner = async (donorUsername: string, ownerUsername: string) => {
  const donationsCollectionRef = collection(db, "donations");
  const donationsQuery = query(
    donationsCollectionRef,
    where("donorUsername", "==", donorUsername),
    where("ownerUsername", "==", ownerUsername),
    where("isDismissed", "==", false)
  );
  const donationsQuerySnapshot = await getDocs(donationsQuery);
  const bannerDoc = doc(db, "donations", donationsQuerySnapshot.docs[0].id);

  console.log(donationsQuerySnapshot.docs[0].data());
  

  await updateDoc(bannerDoc, { ...donationsQuerySnapshot.docs[0].data(), isDismissed: true });
  return;
}

export const getTotalDonationsForPetOwner = async (username: string) => {
  const donationsCollectionRef = collection(db, "donations");
  const donationsQuery = query(
    donationsCollectionRef,
    where("ownerUsername", "==", username)
  );
  const donationsQuerySnapshot = await getDocs(donationsQuery);
  const docs =  donationsQuerySnapshot.docs.map((doc) => doc.data());
  let total = { food: 0, medicine: 0, money: 0 };
  try {
    for (let i = 0; i < docs.length; i++) {
      total.food += docs[i].food;
      total.medicine += docs[i].medicine;
      total.money += docs[i].money;
    }
  } catch (e) {
    console.log(e);
  }
  return total;
};

export const getDonorsByDonations = async (username: string) => {
  const donationsCollectionRef = collection(db, "donations");
  const donationsQuery = query(
    donationsCollectionRef,
    where("ownerUsername", "==", username)
  );
  const donationsQuerySnapshot = await getDocs(donationsQuery);
  const docs = donationsQuerySnapshot.docs.map((doc) => doc.data());
  let donorUsernames = [];
  let donors = [];
  try {
    for (let i = 0; i < docs.length; i++) {
      donorUsernames.push(docs[i].donorUsername);
    }
  } catch (e) {
    console.log(e);
  }
  donorUsernames = [...new Set(donorUsernames)];
  for (let i = 0; i < donorUsernames.length; i++) {
    const donorCollectionRef = collection(db, "donors");
    const donorQuery = query(
      donorCollectionRef,
      where("username", "==", donorUsernames[i])
    );
    const donorQuerySnapshot = await getDocs(donorQuery);
    donors.push(donorQuerySnapshot.docs[0].data());
  }
  console.log(donors);
  
  return donors;
}

export const updateDonors = async (donor:Donor) => {
  const donationsCollectionRef = collection(db, "donors");
  const donationsQuery = query(
    donationsCollectionRef,
    where("username", "==", donor.username),
  );
  const donationsQuerySnapshot = await getDocs(donationsQuery);
  const donationDoc = doc(db, "donors", donationsQuerySnapshot.docs[0].id);
  await updateDoc(donationDoc, donor as any);

  const userCollectionRef = collection(db, "users");
  const userQuery = query(
    userCollectionRef,
    where("username", "==", donor.username),
  );
  const userQuerySnapshot = await getDocs(userQuery);
  const userDoc = doc(db, "users", userQuerySnapshot.docs[0].id);
  const newUser = { username: donor.username, password: donor.password, role: "donor"};
  await updateDoc(userDoc, newUser);
  return;
}
