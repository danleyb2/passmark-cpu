# CPU Perfomance Test

Run CPU tests to get your passmark using <https://www.passmark.com/products/pt_linux/index.php>

## Setup

1. Build the image

    ```bash
    docker build --tag danleyb2/passmark-cpu .
    ```

2. Run Image

    ```bash
    docker run --rm -t danleyb2/passmark-cpu
    ```
