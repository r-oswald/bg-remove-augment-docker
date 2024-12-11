# Background Removal with Deep Learning

This repository shows the code to remove the background of the pictures using the [U2Net](https://arxiv.org/pdf/2005.09007.pdf) pre-trained model.

The application has three simple functions:

1. Remove the background, producing a transparent PNG file.

2. Change the background by another picture.

3. Combine the image and multiple backgrounds to augment the dataset.


### Demos
![Demo](assets/demo1.gif)
<hr>

![Demo](assets/demo2.gif)

### Install

1. Download the Dockerfile
2. In the same directory run
```
docker build -t bg-remove .
```
4. Start the container via one of the following options

*Via The Terminal:*
```
docker run -p 8000:8000 bg-remove
```
*Via Docker Compose:*
```yaml
services:
  bg-remove:
    container_name: bg-remove
    image: bg-remove
    restart: unless-stopped
    ports:
      - 8000:8000
    volumes:
      - ./input:/app/bg-remove-augment-docker/webapp/images-input # Optional if you want to mount the Input folder
      - ./output:/app/bg-remove-augment-docker/webapp/images-output # Optional if you want to mount the Output folder
```
It schould now be reachable via 

| http://localhost:8000/ |  Front-end to perform background remove.

| http://localhost:8000/augmentation |  Front-end to perform augment images.


### References
U2Net: [https://github.com/xuebinqin/U-2-Net](https://github.com/xuebinqin/U-2-Net)


### BibTeX
    @InProceedings{Qin_2020_PR,
        title = {U2-Net: Going Deeper with Nested U-Structure for Salient Object Detection},
        author = {Qin, Xuebin and Zhang, Zichen and Huang, Chenyang and Dehghan, Masood and Zaiane, Osmar and Jagersand, Martin},
        journal = {Pattern Recognition},
        volume = {106},
        pages = {107404},
        year = {2020}
}
