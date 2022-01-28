<?php namespace ProcessWire;
/**
 * Check if number is even or odd
 * @param int $number
 * @return string 
 */
function evenOdd($number) {
  if ($number % 2 == 0) {
    return "even";
  } else {
    return "odd";
  }
}

/**
 *  Add Percent to a number
 *  sum = n + (( p / 100) * n )
 *  @param int $number
 *  @param int $percent
 *  @return int
 */
function addPercent($number, $percent) {
  $sum = $number + (($percent/100) * $number);
  return $sum;
}

/**
 * Discount Price
 * @param int $amount
 * @param int $percent
 * @param int $round
 */
function discountPrice(float $amount, int $percent, int $round = 5) {
  $r = $round;
  $discount = ($percent / 100) * $amount;
  $price = $amount - $discount;
  $price = (round($price) % $r === 0) ? $price : round(($price+$r/2)/$r)*$r;
  return $price;
}