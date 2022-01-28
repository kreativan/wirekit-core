*** You can delete this file ***

Here u can create files that will be executed on http request to the /system/ajax/ url (`$ajax->url`).     
Eg: `<?= $ajax->url ?>contact/` will call for */templates/ajax/contact.php* file.     
This patern is used to handle all kind of ajax based business logic.    

### Example

Fetch request: 
```
<script>
fetch(`${cms.ajax}test/?id=123`)
  .then(response => response.json())
  .then(data => {
    console.log(data);
  })
</script>
```

Async Fetch:
```
<script>
async fetchData() {
  const req = await fetch(`${cms.ajax}test/?id=123`);
  const data = await req.json();
  console.log(data);
}
</script>
```

*/ajax/test.php*
```
<?php namespace ProcessWire

$response = [
  "status" => "success",
  "message" => "Ajax test is OK",
  "id" => $input->get->id
];

header('Content-type: application/json');
echo json_encode($response);

exit();
```