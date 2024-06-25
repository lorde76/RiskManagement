using {riskmanagement as rm} from '../db/schema';

@path: 'service/risk'

service RiskService @(requires: 'authenticated-user') {
  entity Risks @(resrtrict: [
    {
      grant: 'READ',
      to   : 'RiskViewer'
    },
    {
      grant: [
        'READ',
        'WRITE',
        'UPDATE',
        'INSERT',
        'DELETE'
      ],
      to   : 'RiskManager'
    }

  ]) as projection on rm.Risks;

  annotate Risks with @odata.draft.enabled;

  entity Mitigations @(restrict: [
    {
      grant: 'READ',
      to   : 'RiskViewer'
    },
    {
      grant: '*',
      to   : 'RiskManager'
    }

  ]) as projection on rm.Mitigations;

  annotate Mitigations with @odata.draft.enabled;

  // BusinessPartner will be used later
  @readonly
  entity BusinessPartners as projection on rm.BusinessPartners;
}
