# PD Configuration.

name = "pd"
data-dir = "default.pd"

client-urls = "http://127.0.0.1:2379"
# if not set, use ${client-urls}
advertise-client-urls = ""

peer-urls = "http://127.0.0.1:2380"
# if not set, use ${peer-urls}
advertise-peer-urls = ""

initial-cluster = ""
initial-cluster-state = ""

lease = 3
tso-save-interval = "3s"

namespace-classifier = "table"

enable-prevote = true

[security]
# Path of file that contains list of trusted SSL CAs. if set, following four settings shouldn't be empty
cacert-path = ""
# Path of file that contains X509 certificate in PEM format.
cert-path = ""
# Path of file that contains X509 key in PEM format.
key-path = ""

[log]
level = {{ .Values.pd.logLevel | default "info" | quote }}

# log format, one of json, text, console
#format = "text"

# disable automatic timestamps in output
#disable-timestamp = false

# file logging
[log.file]
#filename = ""
# max log file size in MB
#max-size = 300
# max log file keep days
#max-days = 28
# maximum number of old log files to retain
#max-backups = 7
# rotate log by day
#log-rotate = true

[metric]
# prometheus client push interval, set "0s" to disable prometheus.
interval = "15s"
# prometheus pushgateway address, leaves it empty will disable prometheus.
address = ""

[schedule]
max-merge-region-size = 0
max-merge-region-keys = 0
split-merge-interval = "1h"
max-snapshot-count = 3
max-pending-peer-count = 16
max-store-down-time = "{{ .Values.pd.maxStoreDownTime }}"
leader-schedule-limit = 4
region-schedule-limit = 4
replica-schedule-limit = 8
merge-schedule-limit = 8
tolerant-size-ratio = 5.0

# customized schedulers, the format is as below
# if empty, it will use balance-leader, balance-region, hot-region as default
# [[schedule.schedulers]]
# type = "evict-leader"
# args = ["1"]

[replication]
# The number of replicas for each region.
max-replicas = {{ .Values.pd.maxReplicas }}
# The label keys specified the location of a store.
# The placement priorities is implied by the order of label keys.
# For example, ["zone", "rack"] means that we should place replicas to
# different zones first, then to different racks if we don't have enough zones.
{{- if .Values.tikv.storeLabels }}
location-labels = {{ toJson .Values.tikv.storeLabels }}
{{- else }}
location-labels = ["region", "zone", "rack", "host"]
{{- end }}

[label-property]
# Do not assign region leaders to stores that have these tags.
#  [[label-property.reject-leader]]
#  key = "zone"
#  value = "cn1
