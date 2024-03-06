# Herbal-AI

## Overview
This project is designed to be a helpful tool for plant enthusiasts like myself. It features a deep learning model for classifying over 40 different Herbal Indian Plants. Additionally, the project utilizes an external API to fetch detailed medicinal properties and information for each classified plant. By combining the capabilities of deep learning with my passion for botanical knowledge, we aim to create a bridge between traditional herbal wisdom and modern technology.

## Features
- *Plant Classification:* This project employs the MobileNetV2 deep learning architecture for accurate classification of Herbal Indian Plants.

- *Chat DOc:* We have integrated an external API to retrieve comprehensive data about each plant's medicinal properties, traditional uses, and related scientific research.


## Optimizations

- *1st RUN :* We used VGG16 model but soon ran out of RAM and VRAM because of large image size.

- *2nd RUN :* We used MobileNetV2 but with same IMAGE SIZE but ran out of RAM and VRAM again.

- *3rd RUN :* Made a custom 5 layer CNN, ran with test 74.34% accuracy.

- *4th RUN :* Reduced image size and used MobileNetV2 again without trainable parameters, ran with 84.65% test accuracy.

- *5th RUN :* Ran with MobileNetV2 with trainable parameters, ran with 92.50% test accuracy.


## Acknowledgements

 - [Kaggle Reference](https://www.kaggle.com/code/codefantasy/identifying-plants-and-it-s-medicinal-properties)
 - [Plants Dataset](https://data.mendeley.com/datasets/748f8jkphb/3)


## Run Locally

If you have a GPU then make sure to
- Have latest drivers installed
- Have CUDA ToolKit installed
- Have cuDNN installed \
Need help? \
Follow [this](https://www.tensorflow.org/install/pip#windows-native)
bash
  git clone https://github.com/puranjayb/Herbal-AI
  cd .\Herbal-AI\Model\
  python .\app.py


Open terminal to install required files
bash
  conda create --name <new_environment_name> --file requirements.txt


Now just run all the cells in the notebook and let the GPU do its work :)


    
<div><h2><strong>Developers of this Repository -</strong></h2></div>

<table align="center">
<tr align="center">
<td>

**Puranjay B**

<p align="center">
<img src = "https://avatars.githubusercontent.com/u/90250628?s=400&u=59a21a80b8390e1aaefed3038d5f87745e4caf55&v=4"  height="120" alt="Puranjay Bhargava">
</p>
<p align="center">
<a href = "https://github.com/puranjayb"><img src = "http://www.iconninja.com/files/241/825/211/round-collaboration-social-github-code-circle-network-icon.svg" width="36" height = "36"/></a>
<a href = "https://www.linkedin.com/in/puranjayb/">
<img src = "http://www.iconninja.com/files/863/607/751/network-linkedin-social-connection-circular-circle-media-icon.svg" width="36" height="36"/>
</a>
</p>
</td>

<td>

**Aakash**

<p align="center">
<img src = "https://avatars.githubusercontent.com/u/93485049?v=4"  height="120" alt="Aakash">
</p>
<p align="center">
<a href = "https://github.com/Aakash-sittu"><img src = "http://www.iconninja.com/files/241/825/211/round-collaboration-social-github-code-circle-network-icon.svg" width="36" height = "36"/></a>
<a href = "https://www.linkedin.com/in/aakash-sittu/">
<img src = "http://www.iconninja.com/files/863/607/751/network-linkedin-social-connection-circular-circle-media-icon.svg" width="36" height="36"/>
</a>
</p>
</td>

<td>

**Diya V**

<p align="center">
<img src = "https://avatars.githubusercontent.com/u/91045114?v=4"  height="120" alt="Diya">
</p>
<p align="center">
  
<a href = "https://github.com/diyalv"><img src = "http://www.iconninja.com/files/241/825/211/round-collaboration-social-github-code-circle-network-icon.svg" width="36" height = "36"/></a>
<a href = "https://www.linkedin.com/in/diya-varghese/">
<img src = "http://www.iconninja.com/files/863/607/751/network-linkedin-social-connection-circular-circle-media-icon.svg" width="36" height="36"/>
</a>
</p>
</td>

<td>
   
**Jatin Kumar**

<p align="center">
<img src = "https://avatars.githubusercontent.com/u/59236972?v=4"  height="120" alt="Jatin">
</p>
<p align="center">
  
<a href = "https://github.com/jatndotdev"><img src = "http://www.iconninja.com/files/241/825/211/round-collaboration-social-github-code-circle-network-icon.svg" width="36" height = "36"/></a>
<a href = "https://www.linkedin.com/in/jatinnkumar/">
<img src = "http://www.iconninja.com/files/863/607/751/network-linkedin-social-connection-circular-circle-media-icon.svg" width="36" height="36"/>
</a>
</p>
</td>
</table>
