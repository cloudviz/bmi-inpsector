# Bare-Metal-Agentless-Introspection
## Agentless Introspection of Bare Metal Server Using M2
### Project Proposal
**Vision and Goals of the Project:**
- Providing an agentless introspection of Bare metal servers using the M2                          infrastructure and agentless system crawler.
- Using API calls to get system snapshots/observations in order to perform black box security test and check compliance issues against introspective data.
- Mount images of all/intended bare-metal machines at one location to avoid noise in data, reduce fetch latency and security vulnerabilities. 
- Extending the existing crawler to get information in the form of frames (block of information) for each mounted image.
- The frame is analyzed by passing through different checks to detect any possible vulnerabilities or security threats.
- Extend BMI API to allow introspection of bare metal images.
 
 
**Users/Personas Of The Project:** <br/>
Agentless Introspection of Bare Metal Server Images Using M2 will be used and will be a crucial contribution towards MOC as the project is open source.


**Scope and features of the Project:**
- Employing M2 to store the disk images to a remote location.
- Extending the existing Crawler to make API calls to M2 to Clone and mount existing images/snapshots of system information to a different location  
- Extracting information from the location in form of frames(block of plain text) 
- Providing the obtained information(Frame) to annotators which will evaluate the frame for potential vulnerabilities
	
**Solution Concept:**

**Reference Architecture:**

<img src="https://github.com/BU-NU-CLOUD-SP18/Bare-Metal-Agentless-Introspection/blob/master/ref_new.PNG" width="400" height="400" />
                   Figure 1 <br/>
		   
Figure 1 depicts the existing architecture in which the crawler exists on the host where the boot images of the virtual machines are written on the physical disks.


**Agentless Introspection using BMI:**

<img src="https://github.com/BU-NU-CLOUD-SP18/Bare-Metal-Agentless-Introspection/blob/master/arch-new.PNG" width="400" height="400" />	
        Figure 2 <br/>
Figure 2 depicts the architecture of Introspection technique of bare metal servers using master crawler. Bare metal imaging clones the images of bare metal and mounts it to the system crawler as requested by Master crawler. Then master Crawler send the state information to the annotators where analytics is performed to figure out the system vulnerabilities. 


**Comparison:**

| Existing Reference Architecture | Agentless Introspection using BMI |
|---	|---	|
| Crawler(agent) exists in the host containing physical disk(containing boot images) | Crawler exists  in a remote location containing copy of boot images that are to be mounted |
| Agentful introspection | Agentless introspection |
| CPU performance can go down because we are dedicating resources from the  host for crawler | Agentless system will not affect the performance because crawler will be running on a different node |
| Noise and Security vulnerabilities exists as crawlers gathers information while going through the system images | No Noise and security vulnerabilities as the crawler skims through the cloned system images in a separate node |


**Acceptance Criteria:** <br/>
Minimum acceptance criteria is a script that allows The crawler to operate in a specified network to fetch Frames and send them to annotators for analysis.


**Release Planning:** <br/>
Detailed user stories and plans are on the Taiga.
Further releases to be decided after next meeting that is to be held this week.
(will be updated by 2 Feb, 2018)
