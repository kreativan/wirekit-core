<?php
/**
 *  Admin Actions
 *
 *  @author Ivan Milincic <kreativan@outlook.com>
 *  @copyright 2018 Kreativan
 *
 *  @var action
 *
*/

$action  = $this->input->get->admin_action;
$redirect_segment = $this->sanitizer->text($this->input->get->redirect_segment);
$redirect_segment = str_replace("~", "", $redirect_segment);

if($action) {

  $id = $this->sanitizer->selectorValue($this->input->get->id);
  $p = $this->pages->get("id=$id, include=all");;

  //
  // Publish / Unpublish
  //

  if($action == "publish") {

    if($p->isUnpublished()) {

      $p->of(false);
      $p->removeStatus('unpublished');
      $p->save();

      $this->message("{$p->title} has been unpublished");

    } else {

      $p->of(false);
      $p->status('unpublished');
      $p->save();

      $this->message("{$p->title} has been published");

    }

    $this->session->redirect("./$redirect_segment");

  }

  //
  // Trash
  //

  if($action == "trash") {

    $p->trash();

    $this->message("{$p->title} has been trashed");

    $this->session->redirect("./$redirect_segment");

  }

  //
  // Delete
  //

  if($action == "delete") {

    $this->pages->delete($p);

    $this->message("{$p->title} has been deleted");

    $this->session->redirect("./$redirect_segment");

  }

  //
  // Restore
  //

  if($action == "restore") {

    $this->pages->restore($p);

    $this->session->set("admin_status", "message");
    $this->message("{$p->title} has been restored");

    $this->session->redirect("./$redirect_segment");

  }


}


/* ===========================================================
    Group Actions
=========================================================== */

//
//  Group Publis Unpublish
//

if($this->input->post->admin_action_group_publish) {

  $ids = $this->sanitizer->selectorValue($this->input->post->admin_items);
  $pgs = $this->pages->find("id=$ids, include=all");

  if($pgs->count) {
    foreach($pgs as $p) {

      if($p->isUnpublished()) {

        $p->of(false);
        $p->removeStatus('unpublished');
        $p->save();
        $p->of(true);

        $message = "Pages has been published";

      } else {

        $p->of(false);
        $p->status('unpublished');
        $p->save();
        $p->of(true);

        $message = "Pages has been unpublished";

      }

    }
  } else {
      $message = "No pages selected";
  }

  $this->message($message);

  $this->session->redirect("./");

}


//
//  Group Trash
//

if($this->input->post->admin_action_group_delete) {

  $ids = $this->sanitizer->selectorValue($this->input->post->admin_items);
  $pgs = $this->pages->find("id=$ids, include=all");

  if($pgs->count) {
    foreach($pgs as $p) $p->trash();
      $message = "pages deleted";
  } else {
    $message = "No pages selected";
  }

  $this->message($message);

  $this->session->redirect("./");

}


//
//  Group Clone
//

if($this->input->post->admin_action_group_clone) {

  $ids = $this->sanitizer->selectorValue($this->input->post->admin_items);
  $pgs = $this->pages->find("id=$ids, include=all");

  if($pgs->count) {
    foreach($pgs as $p) $this->pages->clone($p);
    $message = "Pages has been cloned";
  } else {
    $message = "No pages selected";
  }

  $this->message($message);

  $this->session->redirect("./");

}
