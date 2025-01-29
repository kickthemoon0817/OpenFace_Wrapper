# OpenFace Wrapper

### 🎯 Why Use OpenFace Wrapper?
#### ✅ Easy real-time facial behavior analysis
#### ✅ No need for external library installation
#### ✅ Seamless integration with Python & other tools

This fork only done for Windows x86, so recommend to use the x86 windows version of OpenFace from the wiki.

## Original Project
This project is based on [OpenFace](https://github.com/TadasBaltrusaitis/OpenFace), an open-source facial behavior analysis toolkit developed by **Tadas Baltrušaitis**.

**For original installation and usage instructions, refer to the official [WIKI](https://github.com/TadasBaltrusaitis/OpenFace/wiki)**

## What’s New in OpenFace-RT?

This fork enhances OpenFace for **real-time applications** and **local builds** with the following modifications:

### Added Embedded 3rd-Party Libraries

- Allows local builds without needing to install external libraries manually.

### Added FeatureExtraction_stdout.exe

#### Why?

- The original FeatureExtraction.exe saves output only to **CSV files**, which is not ideal for real-time use.
- This makes it difficult to **process facial tracking data in Python or other real-time applications**.

#### New Feature: FeatureExtraction_stdout.exe

- Outputs **head pose, gaze estimation, and facial landmarks directly to the standard output** (stdout).
- This allows easy **integration with Python**, streaming applications, or other real-time tools

## How to Use FeatureExtraction_stdout.exe

You can call FeatureExtraction_stdout.exe from Python or any command-line tool to process live facial data.

### Example Usage in Python (subprocess):
```python
import subprocess

cmd = [
    'FeatureExtraction_stdout',
    '-device', '0',
    '-pose',
    '-gaze',
    '-no2Dfp',
    '-no3Dfp',
    '-notracked',
    '-verbose',
]

# Run FeatureExtraction_stdout and capture the output
process = subprocess.Popen(
    cmd,
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE,
    text=True,
    shell=True
)

# Read output in real-time
for line in process.stdout:
    print("Output:", line.strip())

process.wait()
```

## Installation & Compilation

For compilation and installation instructions, follow the **original** [OpenFace Wiki](https://github.com/TadasBaltrusaitis/OpenFace/wiki).

This fork follows the same process, with the addition of **local 3rd-party libraries**.

## 🤝 Contributing

Feel free to **open issues** or submit **pull requests** for further improvements!

## 📜 License

This project follows the **original OpenFace license**. Please refer to LICENSE for details.
