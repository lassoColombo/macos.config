from datetime import datetime as dt

result = llama_aggregate(
    0,
    [
        {
            "$match": {
                "time": {
                    "$gte": dt(2024, 12, 31, 0, 0, 0),
                    "$lte": dt(2024, 12, 31, 30, 0, 0),
                },
                "err": {"$exists": True},
            },
        },
        {"$group": {"_id": {"collector": "$collector", "identity": "$identity"}, "errors": {"$push": "$err"}}},
        {"$project": {"collector": "$_id.collector", "identity": "$_id.identity", "errors": 1, "_id": 0}},
    ],
)
