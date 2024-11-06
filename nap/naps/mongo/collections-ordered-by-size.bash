const dbName = 'logs';
const db = db.getSiblingDB(dbName);

// Get all collections and their sizes
const collections = db.getCollectionNames().map(collName => {
    const stats = db.getCollection(collName).stats();
    return {
        name: collName,
        size: stats.size // size in bytes
    };
});

// Sort collections by size in descending order
collections.sort((a, b) => b.size - a.size);

// Print the collections and their sizes
collections.forEach(collection => {
    print(`${collection.name}: ${collection.size} bytes`);
});
