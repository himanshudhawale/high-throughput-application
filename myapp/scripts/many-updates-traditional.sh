#


source scripts/setenv.sh

for (( i = 0; i < 1000; ++i ))
do
	peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls $CORE_PEER_TLS_ENABLED --cafile ../mynetwork/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C mychannel -n bigdatacc -c '{"Args":["putstandard","'$1'","'$i'"]}'
done
