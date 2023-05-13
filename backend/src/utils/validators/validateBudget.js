// import { pg as knex, UserType } from '../../services/db/index'

// type Budget = {
//   title: string,
//   amount: number,
//   category: string,
//   created_at: Date,
//   updated_at: Date,
// }

export const validateBudget = (budgetObj) => {
  if (!budgetObj) return false;
  if (!budgetObj.title) return false;
  if (!budgetObj.amount) return false;
  if (!budgetObj.category) return false;
  return true;
}