import asyncio, socket

my_task = None

async def some_long_running_task():
    print("start")
    await asyncio.sleep(3)
    print("end")

async def handle_client(reader, writer):
    print(type(reader))
    global my_task
    request = None
    while request != 'quit':
        request = (await reader.read(-1)).decode('utf8')
        print("bla")
        print(request)
        if my_task is not None and not my_task.done():
            response = "still running\n"
        else:
            my_task = asyncio.create_task(some_long_running_task())
            response = "got it\n"
        writer.write(response.encode('utf8'))
        await writer.drain()
        break
    writer.close()

async def run_server():
    server = await asyncio.start_server(handle_client, 'localhost', 15555)
    async with server:
        await server.serve_forever()

asyncio.run(run_server())

