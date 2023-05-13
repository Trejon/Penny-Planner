import moment from 'moment'

export const displayTime = () => {
  const date = moment().locale()
  let hours = moment().hours();
  const minutes = moment().minutes();
  const seconds = moment().seconds();

  let minutesString = minutes.toString();
  let secondsString = seconds.toString();

  const ampm = hours >= 12 ? 'pm' : 'am';

  if (hours > 12) {
    hours = hours - 12;;
  }

  if (minutes < 10) {
    minutesString = '0' + minutes;
  }

  if (seconds < 10) {
    secondsString = '0' + seconds;
  }

  const time = `${hours}:${minutesString}:${secondsString} ${ampm}`;
  console.log("Someone is hitting the api at:", time);
}