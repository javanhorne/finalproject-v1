task (:fhir_call) do
  require fhir_client
  desc 'Call FHIR on Open EPIC'
  baseurl = "https://open-ic.epic.com/FHIR/api/FHIR/DSTU2/"
  patient_search = "/Patient?given=Jason&family=Argonaut"
  client = FHIR::Client.new(baseurl)
  #  client.default_json
  FHIR::Model.client = client

  # autodetect the FHIR version

    # version = client.detect_version

      # if version == :stu3
      #   puts 'FHIR Client using STU3'
      # elsif version == :dstu2
      #   puts 'FHIR Client using DSTU2'
      # elsif version == :r4
      #   puts 'FHIR Client using R4'
      # end


  patient_raw = FHIR::Patient.search(given: 'Jason', family: 'Argonaut')
  p patient_raw.resource


  # patient_id = FHIR::Patient.search(family: 'Argonaut')
  # p patient_id
  # patient_parsed = JSON.parse(patient_raw)
  # patient_parsed = Nokogiri::XML(patient_raw)
  # p patient_parsed

  # patient = FHIR::Patient.read('Tbt3KuCY0B5PSrJvCu2j-PlK.aiHsu2xUjUM8bWpetXoB')

  # https://open-ic.epic.com/FHIR/api/FHIR/DSTU2/Condition?patient=Tbt3KuCY0B5PSrJvCu2j-PlK.aiHsu2xUjUM8bWpetXoB

  # FHIR::ResoucreAddress.resource_url({resource: condition})

  # patient = client.read(FHIR::Patient, "Tbt3KuCY0B5PSrJvCu2j-PlK.aiHsu2xUjUM8bWpetXoB").resource
  # p patient


  # patient = client.search(FHIR::Condition, "T1kK.xqvU20cEJe860G4aKgB")}.resource
  # patient = client.search(FHIR::Condition, search: { parameters: {patient:"Tbt3KuCY0B5PSrJvCu2j-PlK.aiHsu2xUjUM8bWpetXoB"}})
  # bundle = patient.resource
  # patient1 = bundle.entry.first.resource
  # p patient1

end