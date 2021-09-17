from aiohttp import web
from yarl import URL

from app.ui import APP


@APP.route('/theming/', 'GET')
async def get_theme_info(request, **kwargs):
    base_theme = {
        'theme': 'theme-base',
        'favicon_folder': 'hivestack-favicons',
        'header_logo': '/assets/images/hivestack-light.svg',
        'company_logo': {
            'logo': '/assets/images/hivestack-logo-colored-largefont.svg',
            'name': 'Hivestack',
            'imageType': 'svg',
        },
        'subdomain': 'apps',
        'loader_url': '/assets/images/loaders/hivestack-loader.svg',
        'affiliation': True,
    }

    themes = {
        ('astral', 'bell',): {
            'theme': 'theme-a',
            'favicon_folder': 'astral-favicons',
            'header_logo': '/assets/images/astral.svg',
            'company_logo': {
                'logo': '/assets/images/astral-dark.svg',
                'name': 'Astral',
                'imageType': 'svg',
            },
            'subdomain': 'astral',
            'loader_url': '/assets/images/loaders/astral-loading.gif',
            'affiliation': True,
        },
        ('stroeer',): {
            'theme': 'theme-s',
            'favicon_folder': 'stroeer-favicons',
            'header_logo': '/assets/images/stroeer-logo-light.png',
            'company_logo': {
                'logo': '/assets/images/company-logo-dark.svg',
                'name': 'Ströer',
                'imageType': 'svg',
            },
            'subdomain': 'stroeer',
            'loader_url': '/assets/images/loaders/stroeer-loader.svg',
            'affiliation': True,
        },
        ('outfront',): {
            'theme': 'theme-o',
            'favicon_folder': 'outfront-favicons',
            'header_logo': '/assets/images/outfront-logo-light.png',
            'company_logo': {
                'logo': '/assets/images/outfront-logo-dark.png',
                'name': 'Outfront',
                'imageType': 'png',
            },
            'subdomain': 'outfront',
            'loader_url': '/assets/images/loaders/outfront-loader.svg',
            'affiliation': True,
        },
        ('liveboard',): {
            'theme': 'theme-l',
            'favicon_folder': 'liveboard-favicons',
            'header_logo': '/assets/images/liveboard-logo-light.svg',
            'company_logo': {
                'logo': '/assets/images/liveboard-logo-dark.svg',
                'name': 'LIVEBOARD',
                'imageType': 'svg',
            },
            'subdomain': 'liveboard',
            'loader_url': '/assets/images/loaders/liveboard-loader.svg',
            'affiliation': False,
        },
        ('zoommedia',): {
            'theme': 'theme-z',
            'favicon_folder': 'zoommedia-favicons',
            'header_logo': '/assets/images/zoommedia-logo-light.png',
            'company_logo': {
                'logo': '/assets/images/zoommedia-logo-dark.png',
                'name': 'Zoom Media',
                'imageType': 'png',
            },
            'subdomain': 'zoommedia',
            'loader_url': '/assets/images/loaders/zoommedia-loader.svg',
            'affiliation': True,
        },
        ('mediacom',): {
            'theme': 'theme-m',
            'favicon_folder': 'mediacom-favicons',
            'header_logo': '/assets/images/mediacom-logo-light.svg',
            'company_logo': {
                'logo': '/assets/images/mediacom-logo-dark.svg',
                'name': 'Mediacom',
                'imageType': 'svg',
            },
            'subdomain': 'mediacom',
            'loader_url': '/assets/images/loaders/mediacom-loader.svg',
            'affiliation': True,
        },
        ('kinetic',): {
            'theme': 'theme-k',
            'favicon_folder': 'kinetic-favicons',
            'header_logo': '/assets/images/kinetic-logo-light.png',
            'company_logo': {
                'logo': '/assets/images/kinetic-logo-dark.png',
                'name': 'Kinetic',
                'imageType': 'png',
            },
            'subdomain': 'kinetic',
            'loader_url': '/assets/images/loaders/kinetic-loader.svg',
            'affiliation': True,
        },
        ('novus',): {
            'theme': 'theme-n',
            'favicon_folder': 'novus-favicons',
            'header_logo': '/assets/images/novus-logo-light.png',
            'company_logo': {
                'logo': '/assets/images/novus-logo-dark.png',
                'name': 'Novus',
                'imageType': 'png',
            },
            'subdomain': 'novus',
            'loader_url': '/assets/images/loaders/novus-loader.svg',
            'affiliation': True,
        },
        ('asiaray',): {
            'theme': 'theme-y',
            'favicon_folder': 'asiaray-favicons',
            'header_logo': '/assets/images/asiaray-logo-light.png',
            'company_logo': {
                'logo': '/assets/images/asiaray-logo-dark.png',
                'name': 'Asiaray',
                'imageType': 'png',
            },
            'subdomain': 'asiaray',
            'loader_url': '/assets/images/loaders/asiaray-loader.svg',
            'affiliation': True,
        },
        ('captivate',): {
            'theme': 'theme-c',
            'favicon_folder': 'captivate-favicons',
            'header_logo': '/assets/images/captivate-logo-light.png',
            'company_logo': {
                'logo': '/assets/images/captivate-logo-dark.png',
                'name': 'captivate',
                'imageType': 'png',
            },
            'subdomain': 'captivate',
            'loader_url': '/assets/images/loaders/captivate-loader.svg',
            'affiliation': True,
        },
        ('xaxis',): {
            'theme': 'theme-x',
            'favicon_folder': 'xaxis-favicons',
            'header_logo': '/assets/images/xaxis-logo-light.png',
            'company_logo': {
                'logo': '/assets/images/xaxis-logo-dark.png',
                'name': 'xaxis',
                'imageType': 'png',
            },
            'subdomain': 'xaxis',
            'loader_url': '/assets/images/loaders/xaxis-loader.svg',
            'affiliation': True,
        },
        ('posterscope',): {
            'theme': 'theme-p',
            'favicon_folder': 'posterscope-favicons',
            'header_logo': '/assets/images/posterscope-logo-light.png',
            'company_logo': {
                'logo': '/assets/images/posterscope-logo-dark.png',
                'name': 'posterscope',
                'imageType': 'png',
            },
            'subdomain': 'posterscope',
            'loader_url': '/assets/images/loaders/posterscope-loader.svg',
            'affiliation': True,
        },
        ('mindshare',): {
            'theme': 'theme-ms',
            'favicon_folder': 'mindshare-favicons',
            'header_logo': '/assets/images/mindshare-logo-light.png',
            'company_logo': {
                'logo': '/assets/images/mindshare-logo-dark.png',
                'name': 'mindshare',
                'imageType': 'png',
            },
            'subdomain': 'mindshare',
            'loader_url': '/assets/images/loaders/mindshare-loader.svg',
            'affiliation': True,
        },
        ('wavemaker',): {
            'theme': 'theme-w',
            'favicon_folder': 'wavemaker-favicons',
            'header_logo': '/assets/images/wavemaker-logo-light.png',
            'company_logo': {
                'logo': '/assets/images/wavemaker-logo-dark.png',
                'name': 'wavemaker',
                'imageType': 'png',
            },
            'subdomain': 'wavemaker',
            'loader_url': '/assets/images/loaders/wavemaker-loader.svg',
            'affiliation': True,
        },
        ('medialab',): {
            'theme': 'theme-ml',
            'favicon_folder': 'medialab-favicons',
            'header_logo': '/assets/images/medialab-logo-light.png',
            'company_logo': {
                'logo': '/assets/images/medialab-logo-dark.png',
                'name': 'medialab',
                'imageType': 'png',
            },
            'subdomain': 'medialab',
            'loader_url': '/assets/images/loaders/medialab-loader.svg',
            'affiliation': True,
        },
        ('omg',): {
            'theme': 'theme-omg',
            'favicon_folder': 'omg-favicons',
            'header_logo': '/assets/images/omg-logo-light.png',
            'company_logo': {
                'logo': '/assets/images/omg-logo-dark.png',
                'name': 'omg',
                'imageType': 'png',
            },
            'subdomain': 'omg',
            'loader_url': '/assets/images/loaders/omg-loader.svg',
            'affiliation': True,
        },
        ('talon',): {
            'theme': 'theme-ta',
            'favicon_folder': 'talon-favicons',
            'header_logo': '/assets/images/talon-logo-light.png',
            'company_logo': {
                'logo': '/assets/images/talon-logo-dark.png',
                'name': 'talon',
                'imageType': 'png',
            },
            'subdomain': 'talon',
            'loader_url': '/assets/images/loaders/talon-loader.svg',
            'affiliation': True,
        },
        ('buntin',): {
            'theme': 'theme-bt',
            'favicon_folder': 'buntin-favicons',
            'header_logo': '/assets/images/buntin-logo-light.png',
            'company_logo': {
                'logo': '/assets/images/buntin-logo-dark.png',
                'name': 'buntin',
                'imageType': 'png',
            },
            'subdomain': 'buntin',
            'loader_url': '/assets/images/loaders/buntin-loader.svg',
            'affiliation': True,
        },
        ('clearchannel',): {
            'theme': 'theme-cc',
            'favicon_folder': 'clearchannel-favicons',
            'header_logo': '/assets/images/clearchannel-logo-light.svg',
            'company_logo': {
                'logo': '/assets/images/clearchannel-logo-dark.svg',
                'name': 'clearchannel',
                'imageType': 'svg',
            },
            'subdomain': 'clearchannel',
            'loader_url': '/assets/images/loaders/clearchannel-loader.svg',
            'affiliation': True,
        },
        ('olg',): {
            'theme': 'theme-olg',
            'favicon_folder': 'olg-favicons',
            'header_logo': '/assets/images/olg-logo-light.png',
            'company_logo': {
                'logo': '/assets/images/olg-logo-dark.png',
                'name': 'olg',
                'imageType': 'png',
            },
            'subdomain': 'olg',
            'loader_url': '/assets/images/loaders/olg-loader.svg',
            'affiliation': True,
        },
        ('vision7',): {
            'theme': 'theme-v7',
            'favicon_folder': 'vision7-favicons',
            'header_logo': '/assets/images/vision7-logo-light.svg',
            'company_logo': {
                'logo': '/assets/images/vision7-logo-dark.svg',
                'name': 'vision7',
                'imageType': 'svg',
            },
            'subdomain': 'vision7',
            'loader_url': '/assets/images/loaders/vision7-loader.svg',
            'affiliation': True,
        },
        ('oohlabs',): {
            'theme': 'theme-ol',
            'favicon_folder': 'oohlabs-favicons',
            'header_logo': '/assets/images/oohlabs-logo-light.svg',
            'company_logo': {
                'logo': '/assets/images/oohlabs-logo-dark.svg',
                'name': 'oohlabs',
                'imageType': 'svg',
            },
            'subdomain': 'oohlabs',
            'loader_url': '/assets/images/loaders/oohlabs-loader.svg',
            'affiliation': True,
        },
        ('doordash',): {
            'theme': 'theme-dd',
            'favicon_folder': 'doordash-favicons',
            'header_logo': '/assets/images/doordash-logo-light.svg',
            'company_logo': {
                'logo': '/assets/images/doordash-logo-dark.svg',
                'name': 'doordash',
                'imageType': 'svg',
            },
            'subdomain': 'doordash',
            'loader_url': '/assets/images/loaders/doordash-loader.svg',
            'affiliation': True,
        },
        ('cineplex',): {
            'theme': 'theme-cx',
            'favicon_folder': 'cineplex-favicons',
            'header_logo': '/assets/images/cineplex-logo-light.svg',
            'company_logo': {
                'logo': '/assets/images/cineplex-logo-dark.svg',
                'name': 'cineplex',
                'imageType': 'svg',
            },
            'subdomain': 'cineplex',
            'loader_url': '/assets/images/loaders/cineplex-loader.svg',
            'affiliation': True,
        },
        ('vmo',): {
            'theme': 'theme-val',
            'favicon_folder': 'vmo-favicons',
            'header_logo': '/assets/images/vmo-logo-light.svg',
            'company_logo': {
                'logo': '/assets/images/vmo-logo-dark.svg',
                'name': 'vmo',
                'imageType': 'svg',
            },
            'subdomain': 'vmo',
            'loader_url': '/assets/images/loaders/vmo-loader.svg',
            'affiliation': True,
        },
    }

    referer = URL(request.headers.get('Referer', ''))
    host = referer.host

    if not host:
        host = request.headers.get('Host', '')

    theme = base_theme
    for theme_names in themes.keys():
        for theme_name in theme_names:
            if theme_name in host:
                theme = themes[theme_names]

    if 'admin' in host:
        theme['subdomain'] = ''

    return web.json_response(theme)
