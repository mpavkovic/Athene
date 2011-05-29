Ext.define('Athene.store.SkolskaGodina', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.SkolskaGodina', // Must be full path to model
    proxy: {
        type: 'direct',
        directFn: SkolskaGodina.getAll,
        reader: {
            root: 'data'
        }
    },
    sorters: {
        property: 'godina',
        direction: 'DESC'
    }
});