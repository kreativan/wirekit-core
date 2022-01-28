<?php namespace ProcessWire;
/**
 *  Search Page
 * 
 *  Get search results
 *  @example $page->results(10);
 * 
 *  Mark Keyword
 *  @example $page->markWord("lorem ipsum", "ipsum");
 * 
 */

class SearchPage extends Page {

  public function headline() {
    $str_start = "<em class='wk-text-bold wk-text-up'>";
    $str_end = "</em>";
    $headline = str_replace("{", $str_start, $this("headline|title"));
    $headline = str_replace("}", $str_end, $headline);
    return $headline;
  }

  /**
   * Search results
   * @param int|string $limit
   * @return PageArray|bool 
   */
  public function results($limit = 10) {
    $input = wire("input");
    if(!$input->get->q) return false;

    wire("config")->SearchEngine = [
      'find_args' => [
        'limit' => $limit,
      ],
    ];
    
    $query = wire("modules")->get('SearchEngine')->find($input->get->q);
    $results = $query->getResults();
    return $results;
  }

  /**
   *  Mark Keyword in a text
   *  @param string $word
   *  @param string $text
   *  @return string
   */
  public function markWord($word, $text, $class = "tm-text-bg") {
    $word_parts = explode(" ", $word);
    if(count($word_parts) > 1) {
      foreach($word_parts as $w) {
        $text = str_ireplace("$w", "<span class='$class'>$w</span>", $text);
      }
    } else {
      $text = str_ireplace("$word", "<span class='$class'>$word</span>", $text);
    }
    return $text;
  }

}
