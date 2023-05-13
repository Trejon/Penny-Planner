// import { pg as knex, UserType } from '../../services/db/index'

// type User = {
//   created_at: Date,
//   email: string,
//   first_name: string,
//   last_name: string,
//   username: string
//   password: string,
//   updated_at: Date,
// }

export const validateUser = (userObj) => {
  if (!userObj) return false;
  if (!userObj.username) return false;
  if (!userObj.first_name) return false;
  if (!userObj.last_name) return false;
  if (!userObj.email) return false;
  if (!userObj.password) return false;
  return true;
}