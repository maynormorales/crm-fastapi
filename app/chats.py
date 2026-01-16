# -*- coding: utf-8 -*-
from fastapi import APIRouter

router = APIRouter(prefix="/chats", tags=["chats"])

@router.post("/send")
def send_message(to: str, message: str):
    return {
        "status": "sent",
        "to": to,
        "message": message
    }
