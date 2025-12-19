# Background Removal with Deep Learning

> Dockerized fork of [renatoviolin/bg-remove-augment](https://github.com/renatoviolin/bg-remove-augment)

Remove image backgrounds using the [U2-Net](https://arxiv.org/pdf/2005.09007.pdf) pre-trained model.

## Features

- **Remove background** → transparent PNG
- **Replace background** → composite with custom image
- **Dataset augmentation** → batch combine with multiple backgrounds
- **CPU & GPU support** → choose the right image for your hardware

## Demo

![Demo](assets/demo1.gif)

![Demo](assets/demo2.gif)

## Quick Start

### Docker Run

**CPU:**
```bash
docker run -p 8000:8000 ghcr.io/r-oswald/bg-remove-augment:cpu
```

**GPU** (requires NVIDIA Container Toolkit):
```bash
docker run --gpus all -p 8000:8000 ghcr.io/r-oswald/bg-remove-augment:gpu
```

### Docker Compose

```yaml
services:
  bg-remove:
    image: ghcr.io/r-oswald/bg-remove-augment:cpu  # or :gpu
    ports:
      - 8000:8000
    volumes:
      - ./input:/app/bg-remove-augment-docker/webapp/images-input
      - ./output:/app/bg-remove-augment-docker/webapp/images-output
```

### Build Locally

```bash
docker build -f Dockerfile.cpu -t bg-remove:cpu .
docker build -f Dockerfile.gpu -t bg-remove:gpu .
```

### Endpoints

| URL | Description |
|-----|-------------|
| http://localhost:8000/ | Background removal |
| http://localhost:8000/augmentation | Dataset augmentation |

## References

- U2-Net: [github.com/xuebinqin/U-2-Net](https://github.com/xuebinqin/U-2-Net)

```bibtex
@article{Qin_2020_PR,
  title   = {U2-Net: Going Deeper with Nested U-Structure for Salient Object Detection},
  author  = {Qin, Xuebin and Zhang, Zichen and Huang, Chenyang and Dehghan, Masood and Zaiane, Osmar and Jagersand, Martin},
  journal = {Pattern Recognition},
  volume  = {106},
  pages   = {107404},
  year    = {2020}
}
```
