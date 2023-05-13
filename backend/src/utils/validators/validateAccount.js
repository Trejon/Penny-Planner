// import { pg as knex, UserType } from '../../services/db/index'

// export type Account = {
//   id: string,
//   name: string,
//   balance: number,
//   debit: boolean,
//   credit_limit: number | null,
//   bank: string,
//   user_id: string,
//   created_at: Date,
//   updated_at: Date,
// }

export const validateAccount = (accountObj) => {
  if (!accountObj) return false;
  if (!accountObj.name) return false;
  if (!accountObj.balance) return false;
  if (!accountObj.bank) return false;
  return true;
}