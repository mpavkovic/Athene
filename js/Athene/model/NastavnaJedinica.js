Ext.define('Athene.model.NastavnaJedinica', {
    extend: 'Ext.data.Model',
    fields: [
             'id',
             'opis',
             'nastavni_plan_id',
             'nastavni_plan'
             ],
    belongsTo: 'NastavniPlan'
});