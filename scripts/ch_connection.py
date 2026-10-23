import clickhouse_connect
import os
from dotenv import load_dotenv

load_dotenv()

CLICKHOUSE_HOST = os.getenv("CLICKHOUSE_HOST")
CLICKHOUSE_USER = os.getenv("CLICKHOUSE_USER")
CLICKHOUSE_PASSWORD = os.getenv("CLICKHOUSE_PASSWORD")
CLICKHOUSE_PORT = int(os.getenv("CLICKHOUSE_PORT"))
print(CLICKHOUSE_HOST, CLICKHOUSE_USER, CLICKHOUSE_PASSWORD, CLICKHOUSE_PORT)
print("Подключаемся к ClickHouse Cloud...")

try:
    client = clickhouse_connect.get_client(
        host=CLICKHOUSE_HOST,
        port=CLICKHOUSE_PORT,
        username=CLICKHOUSE_USER,
        password=CLICKHOUSE_PASSWORD,
        secure=True
    )

    result = client.command('SELECT version()')
    print(f"✅ Успешное подключение! Версия ClickHouse: {result}")

    tables = client.query("SHOW TABLES").result_rows
    print("\n📋 Список таблиц в ClickHouse:")
    for table in tables:
        print(f"  - {table[0]}")

except Exception as e:
    print(f"❌ Ошибка при подключении: {e}")

