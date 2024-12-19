from datetime import datetime as dt

start = dt(2024, 12, 31, 0, 0, 0)
end = dt(2024, 12, 31, 0, 0, 0)
identity = "{{ identity_name }}"
collector = "{{ collector_name }}"

result = llama_aggregate(
    0,
    [
        {"$match": {"identity": identity, "collector": collector, "time": {"$gte": start, "$lte": end}}},
        {
            "$group": {
                "_id": None,
                "meanTick": {"$avg": "$tick"},
            }
        },
    ],
)
