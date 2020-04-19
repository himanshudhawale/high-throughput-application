# High Throughput application

This application shows how to handle data in an application with a high transaction volume where the transactions all attempt to change the same key-value pair in the ledger. Such an application will have trouble as multiple transactions may read a value at a certain version, which will then be invalid when the first transaction updates the value to a new version, thus rejecting all other transactions until they're re-executed.

Rather than relying on serialization of the transactions, which is slow, this application initializes a value and then accepts deltas of that value which are added as rows to the ledger. The actual value is then an aggregate of the initial value combined with all of the deltas. Additionally, a pruning function is provided which aggregates and deletes the deltas to update the initial value. This should be done during a maintenance window or when there is a lowered transaction volume, to avoid the proliferation of millions of rows of data.

# Network configuration

* [CouchDB]
* [Peer Nodes] : 2
* [Orderer Service] : Solo
* [Channel] : One or more channels allowed


# Testing results

* [Total setup execution time] : 89 secs
* [Transactions per second] : 1000
