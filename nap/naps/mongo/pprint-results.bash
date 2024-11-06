use $DB
var results = db.results.find().limit(5).toArray();
print(JSON.stringify(results, null, 2));
