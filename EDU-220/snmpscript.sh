# Script to retrieve information from Panorama using SNMP.
clear
echo "This script uses the snmpget utility to retrive information from Panorama."
echo ""
echo "Verify the following settings on Panorama before continuing."
echo ""
echo "--> SNMP Network service enabled on management interface"
echo "--> Panorama management interface is 192.168.1.252"
echo "--> SNMP community string is set to notpublic"
echo "--> SNMP Version is set to V2c"
echo ""
echo -n "Press ENTER to continue or CTRL+C to quit"
read anykey
clear
echo "Get the CPU Utilization"
echo ""
echo "The OID for CPU Utilization is .1.3.6.1.2.1.25.3.3.1.2.1"
echo ""
echo "Here is the syntax of the command used:"
echo "snmpget -v 2c -c notpublic 192.168.1.252 .1.3.6.1.2.1.25.3.3.1.2.1"
echo ""
snmpget -v 2c -c notpublic 192.168.1.252 .1.3.6.1.2.1.25.3.3.1.2.1
echo ""
echo -n "Press ENTER to continue or CTRL+C to quit"
read anykey
clear
echo "Get the System Uptime"
echo ""
echo "The OID for System Uptime is .1.3.6.1.2.1.1.3.0"
echo ""
echo "Here is the syntax of the command used:"
echo "snmpget -v 2c -c notpublic 192.168.1.252 .1.3.6.1.2.1.1.3.0"
echo ""
snmpget -v 2c -c notpublic 192.168.1.252 .1.3.6.1.2.1.1.3.0
echo ""
echo -n "Press ENTER to continue or CTRL+C to quit"
read anykey
clear
echo "Get the System Description"
echo ""
echo "The OID for System Description is .1.3.6.1.2.1.1.1.0"
echo ""
echo "Here is the syntax of the command used:"
echo "snmpget -v 2c -c notpublic 192.168.1.252 .1.3.6.1.2.1.1.1.0"
echo ""
snmpget -v 2c -c notpublic 192.168.1.252 .1.3.6.1.2.1.1.1.0
echo ""
echo -n "Press ENTER to continue or CTRL+C to quit"
read anykey
clear
echo "Get the Software Version"
echo ""
echo "The OID for Software Version is .1.3.6.1.4.1.25461.2.1.2.1.1.0"
echo ""
echo "Here is the syntax of the command used:"
echo "snmpget -v 2c -c notpublic 192.168.1.252 .1.3.6.1.4.1.25461.2.1.2.1.1.0"
echo ""
snmpget -v 2c -c notpublic 192.168.1.252 .1.3.6.1.4.1.25461.2.1.2.1.1.0
clear
echo ""
echo "This script is a simple illustration of how to retrieve information from Panorama"
echo "using SNMP. There are dozens of tools, utilities and services available that can poll"
echo "network devices to obtain this kind of information."
echo ""
echo "You are strongly encouraged to implement a monitoring strategy of some time to keep "
echo "track of CPU utilization and similar counters for Panorama."
echo ""
echo -n "Press ENTER to close this window"
read anykey
exit

