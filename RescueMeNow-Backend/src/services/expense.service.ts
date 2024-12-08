import {
  addDoc,
  collection,
  getDocs,
  getFirestore,
  query,
  where,
} from "firebase/firestore";
import firebaseApp from "../config/firebase";
import Expense from "../models/expense.model";

const db = getFirestore(firebaseApp);

export const addExpenses = async (expenseData: Expense) => {
  const expenseCollectionRef = collection(db, "expenses");
  const expenseDoc = await addDoc(expenseCollectionRef, expenseData);
  return expenseDoc;
};

export const getExpensesByOwnerUsernameAndDonorUsername = async (
  username: string,
  donorUsername: string
) => {
  const expensesCollectionRef = collection(db, "expenses");
  const expensesQuery = query(
    expensesCollectionRef,
    where("ownerUsername", "==", username),
    where("donorUsername", "==", donorUsername)
  );
  const expensesQuerySnapshot = await getDocs(expensesQuery);
  return expensesQuerySnapshot.docs.map((doc) => doc.data());
};
