from datetime import datetime as dt

start = dt(2024, 12, 31, 0, 0, 0)
end = dt(2024, 12, 31, 30, 0, 0)
identity = "{{ identity_name }}"
collector = "{{ collector_name }}"
result = llama_aggregate(
    0,
    [
        {
            "$match": {
                "identity": identity,
                "collector": collector,
                "and": [{"from": {"$lte": end}}, {"to": {"$gte": start}}],
            }
        }
    ],
)
