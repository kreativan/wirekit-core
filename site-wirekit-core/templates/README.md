WireKit - ProcessWire Site Profile
============================================================
### Menu Manager
Create and manage menus from custom admin UI...

### Folder Structure

### assets

### ajax
Here u can create files that will be executed on http request to the /ajax/ url.
Eg: *example.com/ajax/contact/* will call for */templates/ajax/contact.php* file.
This is used to handle all kind of ajax based business logic.

### json

### Dynamic Content Ajax and htmx

### lib

### Translator

### Less

### JsonData FieldType and InputField
Dynamic fields based on a template and json files. 
Add *static* field to the template, and create json file: 
*/lib/json/template_name.json* or */assets/json/template_name.json*, 
and define your fields there. Text, textarea, radio and select fields are supported. Multilanguage is supported also...

### Valitron - Validation library
```
if($input->post->submit) {

  // set rules
  $v = $helper->validator($_POST);
  $v->rule('required', ['email', 'your_message']); // validate required
  $v->rule('email', 'email'); // validate email

  // Custom labels
  $v->labels(array(
    'email' => 'E-mail',
    'your_message' => 'Message'
  ));

  // Custom message
  $v->rule('required', ['email', 'your_message'])->message("{field} is required");

  if($v->validate()) {
    d("O yeah!");
  } else {
    d($v->errors());
  }

}
```