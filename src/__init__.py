import os

from foris.config import ConfigPageMixin, add_config_page
from foris.config_handlers import BaseConfigHandler
from foris.core import gettext_dummy as gettext, ugettext as _
from foris.plugins import ForisPlugin

class MQTTPluginConfigHandler(BaseConfigHandler):
    pass

class MQTTPluginPage(ConfigPageMixin, MQTTPluginConfigHandler):
    menu_order = 1
    template = "BC_Dashboard/BC_Dashboard.tpl"
    userfriendly_title = gettext("BC Dashboard")

    def _prepare_render_args(self, args):
        args['PLUGIN_NAME'] = MQTTPluginPlugin.PLUGIN_NAME
        args['PLUGIN_STYLES'] = MQTTPluginPlugin.PLUGIN_STYLES
        args['PLUGIN_STATIC_SCRIPTS'] = MQTTPluginPlugin.PLUGIN_STATIC_SCRIPTS
        args['PLUGIN_DYNAMIC_SCRIPTS'] = MQTTPluginPlugin.PLUGIN_DYNAMIC_SCRIPTS

    def render(self, **kwargs):
        self._prepare_render_args(kwargs)
        return super(MQTTPluginPage, self).render(**kwargs)

class MQTTPluginPlugin(ForisPlugin):
    PLUGIN_NAME = "BC_Dashboard"
    DIRNAME = os.path.dirname(os.path.abspath(__file__))

    PLUGIN_STYLES = [
        "css/BC_Dashboard.css",
    ]
    PLUGIN_STATIC_SCRIPTS = [
    ]
    PLUGIN_DYNAMIC_SCRIPTS = [
        "BC_Dashboard.js"
    ]

    def __init__(self, app):
        super(MQTTPluginPlugin, self).__init__(app)
        add_config_page("BC_Dashboard", MQTTPluginPage, top_level=True)
