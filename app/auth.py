# -*- coding: utf-8 -*-
from fastapi import APIRouter

router = APIRouter(prefix="/auth", tags=["auth"])

@router.post("/login")
def login(username: str, password: str):
    return {
        "status": "ok",
        "user": username
    }
