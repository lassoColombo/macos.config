var PERIODO_DI_OSSERVAZIONE_ORE = 7 * 24;
var LUNGHEZZA_INTERVALLI_TEMPORALI_MINUTI = 60;

// Define the time range
var to_time = new Date();
// Uncomment the following line if you want the observation period to start at the 0th minute of the current hour
// to_time.setMinutes(0, 0, 0);
var from_time = new Date(to_time - PERIODO_DI_OSSERVAZIONE_ORE * 60 * 60 * 1000);

db.logs.metrics.suricata.aggregate([
    {
        $match: {
            timestamp: { $gte: from_time, $lte: to_time }
        }
    },
    {
        $addFields: {
            interval_start: {
                $toDate: {
                    $subtract: [
                        { $toLong: "$timestamp" },
                        { $mod: [{ $toLong: "$timestamp" }, LUNGHEZZA_INTERVALLI_TEMPORALI_MINUTI * 60 * 1000] }
                    ]
                }
            }
        }
    },
    {
        $group: {
            _id: { tempo: "$interval_start" },
            Mbps: { $addToSet: "$Mbps" },
            mbps_avg_temp: { $avg: { $toDouble: "$Mbps" } }
        }
    },
    {
        $addFields: {
            time: "$_id.tempo"
        }
    },
    {
        $addFields: {
            mbps_avg: { $round: ["$mbps_avg_temp", 2] }
        }
    },
    {
        $project: {
            _id: 0,
            Mbps: 0,
            mbps_avg_temp: 0
        }
    },
    {
        $sort: {
            time: -1
        }
    }
]);

