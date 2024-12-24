from typing import Union
from fastapi import FastAPI, WebSocket

app = FastAPI()

@app.get("/")
def read_root():
    return {
        "version": "0.1.0",
        "repository": "https://github.com/NotReeceHarris/rpi-lora-comms"
    }

@app.websocket("/ws")
async def websocket_endpoint(websocket: WebSocket):
    await websocket.accept()
    try:
        while True:
            # Receive text data from the client
            data = await websocket.receive_text()
            # Echo the message back to the client
            await websocket.send_text(f"Message text was: {data}")
    except:
        # If the client disconnects, the loop will end
        print("WebSocket disconnected")