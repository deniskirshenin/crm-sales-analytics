import clickhouse_connect

if __name__ == '__main__':
    client = clickhouse_connect.get_client(
        host='ip6vy6iewk.germanywestcentral.azure.clickhouse.cloud',
        user='default',
        password='nZ86SdKJ4nE.1',
        secure=True
    )

print("Result:", client.query("SELECT 1").result_set[0][0])