FROM node:latest as builder
WORKDIR /offline_dir
RUN npm install --no-save latest-version
RUN npm install --no-save chart.js bootstrap chartjs-plugin-zoom chartjs-adapter-date-fns socket.io-client

FROM python:3.11-alpine
WORKDIR /app_dir
COPY . /app_dir
COPY --from=builder /offline_dir/node_modules/chart.js/dist/chart.umd.js /app_dir/static/chart.umd.js
COPY --from=builder /offline_dir/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js /app_dir/static/bootstrap.bundle.min.js
COPY --from=builder /offline_dir/node_modules/socket.io-client/dist/socket.io.min.js /app_dir/static/socket.io.min.js
COPY --from=builder /offline_dir/node_modules/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js /app_dir/static/chartjs-adapter-date-fns.bundle.min.js
COPY --from=builder /offline_dir/node_modules/chartjs-plugin-zoom/dist/chartjs-plugin-zoom.min.js /app_dir/static/chartjs-plugin-zoom.min.js
COPY --from=builder /offline_dir/node_modules/bootstrap/dist/css/bootstrap.min.css /app_dir/static/bootstrap.min.css
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

EXPOSE 5000
CMD ["gunicorn", "LogixWebTrendDocker:app", "-c", "gunicorn_config.py"]
