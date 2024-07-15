# Ebuild файл для бинарного Promtail

EAPI=8

DESCRIPTION="Promtail - агент журнала для Loki"
HOMEPAGE="https://github.com/grafana/loki"
SRC_URI="https://github.com/grafana/loki/releases/download/v3.1.0/promtail-linux-amd64.zip -> ${P}.zip"

# Лицензия, ключевые слова и поддержка слотов
LICENSE="Apache-2.0"
KEYWORDS="~amd64"
SLOT="0"

# Зависимости пакета
RDEPEND="acct-group/promtail
         acct-user/promtail"
DEPEND="${RDEPEND}"

# Функция подготовки сборки
src_unpack() {
    unpack ${A}
}

# Функция установки
src_install() {
    dodir /usr/bin
    dobin promtail-linux-amd64
    mv "${D}/usr/bin/promtail-linux-amd64" "${D}/usr/bin/promtail"

    # Установим права и владельца
    fowners promtail:promtail /usr/bin/promtail
    fperms 0755 /usr/bin/promtail

    # Установка конфигурационного файла
    insinto /etc/promtail
    newins "${FILESDIR}/promtail-local-config.yaml" promtail-local-config.yaml

    # Установка файла конфигурации для OpenRC
    newconfd "${FILESDIR}/promtail.confd" promtail
    newinitd "${FILESDIR}/promtail.initd" promtail
}

# Дополнительные документы
DOCS=(README.md)

