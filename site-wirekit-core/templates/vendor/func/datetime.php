<?php namespace ProcessWire;
/**
 *  Add days to date
 *  @param integer|date $date - timestamp or date("y-m-d")
 *  @param string $days - number (string) of days to add
 *  @return integer new timestamp
 */
function addDays($date, $days) {
  $date = is_int($date) ? date("y-m-d", (int)$date) : $date;
  $new_date = strtotime("+$days days", strtotime($date));
  return $new_date;
}

/**
 *  Calculate difference between two dates
 *  and get the results in specified format
 *
 *  NOTE: Difference between this function and processwire elapsedTimeStr()
 *  is that this one returns integer, jsut a number of months/days etc...
 *
 *  @param integer $date1 - timestamp
 *  @param integer $date2 - timestamp
 *  @param string $format - days|years|months|hours|minutes
 *  @return integer
 */
function dateTimeDiff($date1, $date2, $format = "days") {

  $date1 = date("Y-m-d H:i:s", (int)$date1);
  $date2 = date("Y-m-d H:i:s", (int)$date2);

  $start_date = new \DateTime($date1);
  $end_date   = new \DateTime($date2);
  $diff = $start_date->diff($end_date);

  switch ($format) {
    case 'days':
      $result = $diff->days;
      break;
    case 'years':
      $result = $diff->y;
      break;
    case 'months':
      $result = $diff->m;
      break;
    case 'hours':
      $result = $diff->days * 24;
      break;
    case 'minutes':
      $result = $diff->days * 24 * 60;
      $result += $diff->h * 60;
      $result += $diff->i;
      break;
    default:
      $result = $diff->d;
      break;
  }

  return (int) $result;

}