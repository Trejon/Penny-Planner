// import { pg as knex, UserType } from '../../services/db/index'

// type Transaction = {
//   id: string,
//   title: string,
//   amount: number,
//   credit: boolean,
//   memo: string,
//   occurrence_frequency: string,
//   due_by_date: Date,
//   payee: string,
//   user_id: string,
//   account_id: string,
//   updated_at: Date,
//   created_at: Date,
// }

export const validateTransaction = (transactionObj) => {
  if (!transactionObj) return false;
  if (!transactionObj.title) return false;
  if (!transactionObj.amount) return false;
  if (!transactionObj.due_by_date) return false;
  if (!transactionObj.payee) return false;
  return true;
}