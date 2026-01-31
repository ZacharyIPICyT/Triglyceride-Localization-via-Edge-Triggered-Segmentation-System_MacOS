from setuptools import setup, find_packages

setup(
    name="lipidos-analysis-tool",
    version="1.0.0",
    packages=find_packages(),
    install_requires=[
        'opencv-python>=4.8.0',
        'numpy>=1.24.0',
        'matplotlib>=3.7.0',
        'pandas>=2.0.0',
    ],
    entry_points={
        'console_scripts': [
            'Triglyceride Localization via Edge-Triggered Segmentation System=src.main:main',
        ],
    },
)
