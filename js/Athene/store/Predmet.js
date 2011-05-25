Ext.define('Athene.store.Predmet', {
    extend: 'Ext.data.Store',
    model: 'Athene.model.Predmet',
    proxy: {
        type: 'direct',
        directFn: Predmet.getAll
    },
    sorters: [
        {
            property: 'naziv'
        }
    ]
});