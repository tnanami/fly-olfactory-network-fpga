# System requirements
## Software
- Windows 10
- jupyter notebook
- Xilinx Vivado 2016.4
## Hardware
- Digilent cmoda7-35t (xilinx artix-a7) FPGA board

# Installation guide
## jupyter notebook
You can download from
https://jupyter.org/
Installation takes several minutes.
## Xilinx Vivado 2016.4
You can download from
https://japan.xilinx.com/support/download/index.html/content/xilinx/ja/downloadNav/vivado-design-tools/archive.html
Installation takes several hours.

# Demo
## Instructions to run on data
1. Connect Cmoda7 and PC with cable and open "./vivado_projects/FlyOlfactoryNetwork/FlyOlfactoryNetwork.xpr" using vivado
2. Program the bitstream file into cmoda7 on vivado
3. Run "./03_demo/run_OAL_demo.ipynb" on jupyter notebook (please set PORT_NAME properly).
## Expected output
You can see activities of neurons with olfactory associative learning.
## Expected run time for demo on a "normal" desktop computer
It takes about 5 minutes.

# Instructions for use
## How to run the software on your data
1. Connect Cmoda7 and PC with cable and vivado file in "./vivado_projects"
2. Program the bitstream file into cmoda7 using vivado
3. You can run ipynb files on jupyter notebook to perform in silico experiments (please set PORT_NAME properly). 
## Reproduction instructions
1. Connect Cmoda7 and PC with cable
2. Run ipynb files in "./00_preparation"
  - generate_coe_and_ORNtype.ipynb
    - This code generates .coe files and ORNtype.csv from hemibrain (v.1.2.1) connectome database.
    - The .coe files denote connection matrix of target neurons and are used to implement olfactory network on cmoda7.
    - The ORNtype.csv describes each ORN type and is used to generate ORN response files.
  - generate_ORNcsv.ipynb
    - This code generates ORN response csv files, which are used as the input data to the olfactory network.
    - This code uses DoOR dataset.
3. Run ipynb files in "./01_insilico_experiments"
  Before executing the following codes, please set the PORT_NAME properly in the codes.
  PORT_NAME must be set to the name of the USB port to which cmoda7 is connected.
  - run_OAL.ipynb
    - This code performs in silico simulation for olfactory associative learning.
    - To execute this code, please program the vivado project "./vivado_projects/FlyOlfactoryNetwork" on cmoda7. 
    - The results of the simulation are stored in ../outputs/OAL/ folder.
    - This code performs 100 trials consisting of 10 learnings for the given odor (odor_index should be set to from 0 to 5).
  - run_oscillation.ipynb
    - This code performs in silico simulation for oscillations in antennal lobe.
    - To execute this code, please program the vivado project "./vivado_projects/FlyOlfactoryNetwork" on cmoda7. 
    - The results of the simulation are stored in ../outputs/oscillation/ folder.
  - run_oscillation_multiodors.ipynb
    - This code performs in silico simulation for oscillations in antennal lobe with multiple odors.
    - To execute this code, please program the vivado project "./vivado_projects/FlyOlfactoryNetwork" on cmoda7. 
    - The results of the simulation are stored in ../outputs/oscillation_multiodors/ folder.
  - run_MBONa1.ipynb
    - This code performs in silico simulation for temporal dynamics of firing in MBONa1.
    - To execute this code, please program the vivado project "./vivado_projects/FlyOlfactoryNetwork" on cmoda7. 
    - The results of the simulation are stored in ../outputs/MBONa1/ folder.
  - run_MBONa1_noAPL.ipynb
    - This code performs in silico simulation for temporal dynamics of firing in MBONa1 without APL.
    - To execute this code, please program the vivado project "./vivado_projects/no_APL" on cmoda7. 
    - The results of the simulation are stored in ../outputs/MBONa1_noAPL/ folder.
  - run_PQNest.ipynb
    - This code performs the in silico simulation for plotting activities of each PQN unit. 
    - To execute this code, please program the vivado project "./vivado_projects/PQNtest" on cmoda7. 
    - The results of the simulation are stored in ../outputs/PQNtest/ folder.
4. Run ipynb files in "./02_plot_figs"
  - analyze_OAL.ipynb
    - This code analyzes the simulation results in ../outputs/OAL/ folder and plots Figure 3 and Supplementary Figure 11.
  - analyze_oscillation.ipynb
    - This code analyzes the simulation results in ../outputs/oscillation/ folder and plots Figure 4.
  - analyze_oscillation_multiodors.ipynb
    - This code analyzes the simulation results in ../outputs/oscillation_multiodors/ folder and plots Supplementary Figure 9.
  - analyze_MBONa1.ipynb
    - This code analyzes the simulation results in ../outputs/MBONa1/ and ../outputs/MBONa1_noAPL/ folders and plots Figure 5 and Supplementary Figure 10.
  - analyze_PQNest.ipynb
    - This code analyzes the simulation results in ../outputs/PQNtest/ folder and plots Figure 2 and Supplemetnary Figures 1-7. 
  - generate_Figure8.ipynb
    - This code generates a figure of synaptic connection from hemibrain (v.1.2.1) connectome database. 
  - resource_usage.ipynb
    - This code plots resource usage

# Files
## Resorces
- DoOR
 - Each files show response properties of each odorant receptors.
 - These files are from http://neuro.uni-konstanz.de/DoOR/default.html
## invivo_results
recorded data from each type of neurons
- LN
 - from [Seki et al., *Journal of Neurophysiology*, 2010]
- PN
- KC
- MBON
## vivado_projects
Compiled vivado projects are stored.
Please use with Vivado 2016.4
## outputs
Experimental data generated by executing ipynb files.
## 00_preparation
ipynb files for preparing in silico experiments
## 01_insilico_experiments
ipynb files for excuting in silico experiments
## 02_plot_figs
ipynb files for plotting figures