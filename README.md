BatMic.bat - RTSP Audio Streamer

BatMic.bat is a simple BAT script that turns your PC into an IP microphone by streaming audio over the network using the RTSP protocol. The script utilizes VLC Media Player to capture and broadcast the audio stream.
📝 Description

BatMic.bat:

    Captures audio input from your PC.
    Streams the audio over RTSP, playable on any media player that supports RTSP (e.g., VLC, ffplay).
    Automatically opens and closes the necessary firewall ports on Windows.

🔧 Key Features

    Verifies VLC Media Player's presence at a user-specified path.
    Opens port 8554 in the Windows firewall for RTSP streaming.
    Captures audio using VLC and starts the stream.
    Provides the user with a URL to access the audio stream.
    Handles stream termination and VLC shutdown gracefully.

🚀 Installation and Usage
1. Requirements

    VLC Media Player installed. Download it from the official website: [videolan.org](https://www.videolan.org/).
    Windows with administrative privileges (required for firewall rules).

2. Setup

    Download the script and save it to a convenient directory.
    Ensure the path to VLC (VLC_PATH) is correctly set in the script:

set VLC_PATH="C:\Program Files\VideoLAN\VLC\vlc.exe"


    Modify the path if needed to match your VLC installation.

3. Running the Script

    Run BatMic.bat by double-clicking it.
    If VLC is not installed or the path is incorrect, the script will notify you.
    Once started, the script will provide you with a URL to access the stream, e.g.:

rtsp://192.168.1.100:8554/stream


    Use any RTSP-compatible media player to play the stream.

![2024-11-15_21-01-43](https://github.com/user-attachments/assets/90ba5058-2250-4a32-ab56-88e85b5d0a23)


4. Stopping the Stream

    During execution, the script will prompt you to choose an action:
        Y: Keep the stream running but close the console window.
        N: Stop the stream and terminate VLC.

📦 Project Files

    BatMic.bat: The primary BAT script for audio streaming.

💻 Technical Details

    RTSP Port: 8554 (can be changed in the script).
    Audio Format: PCM (s16l).
    Dependencies: VLC Media Player, Windows Command Prompt.

🛠 Troubleshooting

    VLC Not Found
    Ensure the VLC_PATH variable in the script points to the correct path where vlc.exe is installed.

    No Audio in the Stream
        Verify that VLC has access to your audio input device.
        Ensure the correct audio input device is selected.

    Cannot Connect to the Stream
        Make sure port 8554 is open in the firewall.
        Double-check the IP address provided by the script.

💖 Support the Project

If this project was helpful, consider supporting the author:

BTC: bc1qy20dmmg4s73dn6j8c64m9n2t37acjqa400rpgh

ETH (ERC20): 0x99350FC8847Fd4DDA5CB40A3d395e69574123d46

USDT (TRC20): TAZdminBeSRm77pfUQpw629M7htsNA47Dw

Disclaimer: This project is provided "as is" without any warranties. Use it at your own risk.
