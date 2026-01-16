# -*- coding: utf-8 -*-
from fastapi import FastAPI
from app.auth import router as auth_router
from app.chats import router as chats_router

app = FastAPI(title="CRM WhatsApp MVP")

app.include_router(auth_router)
app.include_router(chats_router)

@app.get("/")
def root():
    return {"status": "running"}
