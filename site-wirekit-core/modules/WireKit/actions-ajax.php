<?php
/**
 *  Ajax Actions Group
 *  @author Ivan Milincic <kreativan.dev@gmail.com>
 *  @link http://www.kraetivan.dev
*/


$ajax_action = $this->input->get->ajax_action;

if($ajax_action) {

  // disable all notice for ajax actions
  // to prevent errors and return fails
  @error_reporting(E_ALL ^ E_NOTICE);

  $id = $this->sanitizer->selectorValue($this->input->get->id);
  $p  = $this->pages->get($id);


  //
  //  Publish
  //

  if($ajax_action == "publish") {

    if($p->isUnpublished()) {

      $p->of(false);
      $p->removeStatus('unpublished');
      $p->save();
      $p->of(true);

    } else {

      $p->of(false);
      $p->status('unpublished');
      $p->save();
      $p->of(true);

    }

    exit();

  }

  //
  //  Hide
  //

  if($ajax_action == "hide") {

    if($p->isHidden()) {

      $p->of(false);
      $p->removeStatus('unpublished');
      $p->save();
      $p->of(true);

    } else {

      $p->of(false);
      $p->status('unpublished');
      $p->save();
      $p->of(true);

    }

    exit();

  }

  //
  //  Trash
  //

  if($ajax_action == "trash") {

    $p->trash();
    exit();

  }

  //
  //  Delete
  //

  if($ajax_action == "delete") {
    
    $this->pages->delete($p);
    exit();

  }

  //
  //  Restore
  //
  if($ajax_action == "restore") {

    $this->pages->restore($p);
    exit();

  }

}