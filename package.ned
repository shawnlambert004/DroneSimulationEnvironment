package attenuationperformance.simulations;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.inet.WirelessHost;  // Explicitly import WirelessHost
import inet.physicallayer.wireless.common.medium.RadioMedium;
import inet.visualizer.contract.IIntegratedVisualizer;

network itworked
{
    parameters:
        int numHosts;  
        @display("bgb=650,500;bgg=100,1,grey95");	
	    @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);
		            
    submodules:
        visualizer: <default(firstAvailableOrEmpty("IntegratedCanvasVisualizer"))> like IIntegratedVisualizer if typename != "" {
            @display("p=580,125");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=580,200");
        }
        radioMedium: RadioMedium {
            @display("p=580,275");
        }
        host[numHosts]: WirelessHost {  // Use WirelessHost directly to ensure compatibility
            parameters:
                wlan.typename = "Ieee80211Nic";  // Set NIC type for the wireless communication
            @display("i=device/cellphone");  
        }
}


