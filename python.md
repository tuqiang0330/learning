# Python

--------------------------------------------------------------------------------

## 文章 ##

[我们在360如何使用Python](http://blogs.360.cn/blog/how-360-uses-python-0/)

[以正确的方式开源 Python 项目](http://www.oschina.net/translate/open-sourcing-a-python-project-the-right-way?print)

[Flask-Pypi-Proxy](https://pypi.python.org/pypi/Flask-Pypi-Proxy)

[Python Packaging User Guide](https://python-packaging-user-guide.readthedocs.org/en/latest/index.html)

--------------------------------------------------------------------------------

## 通过Flask-Pypi-Proxy搭建PyPI私服

<https://flask-pypi-proxy.readthedocs.org/en/latest/index.html>

1. 创建虚拟环境

        # mkvirtual pypi_proxy

2. 安装Flask-Pypi-Proxy

        # pip install Flask-Pypi-Proxy

3. 创建配置文件 `# vim pypi_proxy.conf`

        {
            "BASE_FOLDER_PATH": "/path/to/pypi_proxy/eggs",
            "PRIVATE_EGGS": ["app1", "app2"],
            "PYPI_URL": "http://pypi.op.ksyun.com/",
            "LOGGING_PATH": "/path/to/pypi_proxy/log",
            "LOGGING_LEVEL": "DEBUG"
        }

4. 创建wsgi文件 `# vim pypi_proxy.wsgi`

        import os
        os.environ['FLASK_PYPI_PROXY_CONFIG'] = '/path/to/pypi_proxy/pypi_proxy.conf'
        from flask_pypi_proxy.views import app as application

5. 启动HTTP服务

        # mod_wsgi-express start-server /path/to/pypi_proxy/pypi_proxy.wsgi --reload-on-changes --server-root=/path/to/pypi_proxy/apache

6. 上传包到pypi

        # python setup.py sdist upload -r http://ip:port/pypi

7. 通过pypi安装包

        # python install -i http://ip:port/simple/ requests
