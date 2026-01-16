# -*- coding: utf-8 -*-
import psycopg2

def get_connection():
    return psycopg2.connect(
        host="localhost",
        database="crm_whatsapp",
        user="postgres",
        password="admin123"
    )

def get_cursor():
    conn = get_connection()
    return conn, conn.cursor()
