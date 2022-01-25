<template>
    <div>
    <div v-if="step === 0" class = heatMap>
       <!-- <div>
                      <input 
                      type="number"
                      min=1 max=5
                      style="width:60%; height: 20%"
                      v-model="surveyData.question4_alt"
                      :class="{invalid:surveyData.question4_alt < 1 || surveyData.question4_alt > 5}"
                      > 
                    </div> -->

        <div style="border: 4px solid black; padding: 5px">
            <ul>
              <li>Zuckerrüben sind immer mehr von Wirkstoffverlusten in Pflanzenschutzmitteln betroffen und Landwirtinnen und Landwirte brauchen Alternativen. Bei der Suche nach Alternativen ist es oft hilfreich zu schauen, was Berufskollegen und -kolleginnen in der Region machen. </li>
              <br>
              <li>Wir von der Uni Bonn möchten wissen, wie Sie sich zu diesem Thema mit Ihren Berufskolleginnen und -kollegen austauschen. </li>
               <ul>
                  <li>Wie wird Unkraut in Zuckerrüben aktuell bekämpft?</li>
                  <li>Welche Rolle spielen neue Techniken wie kameragesteuerter Hacken?</li>
                  <li>Nutzen Landwirtinnen und Landwirte in räumlicher Nähe zueinander die gleichen Techniken?</li>
                  <li style="font-weight: 1000">Egal wie Sie Ihr Unkraut bekämpfen – es interessiert uns!</li>
               </ul>
              <br>
              <li>Als Landwirt/in haben Sie die Möglichkeit, <b>anonym</b> in unserer kurzen Umfrage anzugeben, wie Sie Unkraut bekämpfen. Auf einer Karte können Sie die aktuellen Ergebnisse der Umfrage einsehen und vergleichen, welche Techniken zur Unkrautbekämpfung wo in Deutschland verwendet werden.</li>
                <br>
              <li><mark style="color: #1adee8; background: none; font-size: 16px"><i>Unter je 100 Teilnehmern werden drei Gutscheine im Wert von 50 € für Engelbert Strauss verlost.</i></mark></li>
            </ul>  
        </div>
         <div style="margin: 0px; padding: 5px; border:4px solid black">
           <h2 style="text-align: center">Karte</h2>
                   
         <section>
              <legend style="font-size: 15px">
              <ul>
                <li>Wählen Sie eine Unkrautbekämpfungsmethode um zu sehen, wie die Verteilung in Deutschland ist.</li>
                <li>Zur Orientierung sind die Zuckerrübenfabriken eingezeichnet.</li>
                <li>Die Daten werden aggregiert und sind so auch für andere Teilnehmer der Umfrage zu sehen. Es können keine Rückschlüsse auf individuelle Betriebe gezogen werden.</li>
              </ul>   
              </legend>
            <select class="bootstrap-select" style="width: 15em; border: 2px black solid"
              v-model="chosen_technique">             
              <option value="choose">Bitte auswählen</option>
              <option value="Alle Techniken">Alle Techniken</option>
              <option value="Striegel">Striegel</option>
              <option value="Hackstriegel">Hackstriegel</option>
              <option value="Reihenstriegel">Reihenstriegel</option>
              <option value="Rotorstriegel">Rotorstriegel</option>
              <option value="Scharhacke">Scharhacke</option>
              <option value="Trennhacke">Trennhacke</option>
              <option value="Rollhacke">Rollhacke</option>
              <option value="Fingerhacke">Fingerhacke</option>
              <option value="Kombination Hacke-Bandspritze">Kombination Hacke-Bandspritze</option>
              <option value="Häufelgerät">Häufelgerät</option>
              <option value="Hackbürste">Hackbürste</option>
              <option value="Hackfräse">Hackfräse</option>
            </select>
            </section>
        </div>
       <div style="border: 4px solid black">
      <keep-alive>
            <heatmapbox v-bind:heatmap-data="heatmap_coords" :selected-technique="chosen_technique">
            </heatmapbox>
      </keep-alive>
     </div>
      <div style="padding: 5px">
    <button style="background-color: #182f4e;
                        color: white;
                        left: 250px;
                        height:100px;
                        position: relative;
                        width:290px;absolute
                        padding: 15px 32px;
                        text-align: center;
                        text-decoration: none;
                        display: inline-block;
                        font-size: 22px;
                        margin: 4px 2px;" @click.prevent="next()" @click="scrollToTop()">zur Umfrage</button>
    </div>
   </div>
      
    <div v-if="step === 1" class = firstPage>
            <section>

                    <div style="margin: 5px; padding: 5px; border: 4px solid black;">
                      <h2 style="text-align: center">Willkommen zu unserer Umfrage für Unkrautbekämpfung in Zuckerrüben!</h2>
                        <p>
                        Die Umfrage wird max. 10 Minuten in Anspruch nehmen. 
                        Alle Ergebnisse werden anonymisiert analysiert. 
                        Wenn Sie möchten, senden wir Ihnen die zusammengefassten Ergebnisse der Studie zu. 
                        Dazu können Sie im Anschluss an die Studie Ihre e-Mail Adresse angeben.
                        </p>
                        <p>
                        Zur Hilfe haben wir in der Umfrage Tipps hinterlegt, die Sie über das ?-Symbol aufrufen können.
                        </p>
                        <p>
                        Bei Fragen wenden Sie sich bitte an:
                        <br>
                        <br>
                        Anna Massfeller
                        <br/>
                        Doktorandin am Institut für Lebensmittel- und Ressourcenökonomik, Universität Bonn
                        <br />
                        E-mail: <a href="mailto:anna.massfeller@ilr.uni-bonn.de" style="color: #1adee8">anna.massfeller@ilr.uni-bonn.de</a> 
                      </p>
                   </div>
                   <div style="margin: 5px; padding: 5px; border: 4px solid black;">
                      <ul style="position: relative; margin: 2px; padding: 10px">
                        <li>
                        Die in der Umfrage gewählte männliche Form bezieht sich immer zugleich auf weibliche, diverse und männliche Personen.
                        </li>
                        <li>
                        Um die Umfrage zu öffnen, akzeptieren Sie bitte unsere Datensicherheitserklärung.
                        </li>
                      </ul>
                     <button v-on:click="isHidden = !isHidden" style="width: 220px; height: 45px;font-weight: bold;">Datensicherheitserklärung anzeigen</button>                     
                  </div>
                  <!-- margin:auto ;display:block -->
                      <div v-if="isHidden">
                      <div style="border:3px solid black; margin:10px; padding:10px" lang="de-DE" >
                      <br>
                      <h3 class="western" align="center">Einverständniserklärung in die Erhebung und Verarbeitung von Daten</h3>
                <br/>
                <p align="center" style="font-size: 12pt"><i>Durch</i></p>
                <br/>
                <p align="center" style="font-size: 12pt"><b>- Institut für Lebensmittel-
                und Ressourcenökonomik (ILR)</b> -</p>
                <p align="center"><i>Landwirtschaftliche
                Fakultät der Universität Bonn</i></p>
                <br/>
                <p style="margin-bottom: 0in; line-height: 108%">Für die Umfrage
                „Mechanische Unkrautbekämpfung in Zuckerrüben“ erfolgt die
                Erhebung und Verarbeitung folgender personenbezogener Daten:
                <ul>
                  <li>Alter</li>
                  <li>Angaben zum Betrieb</li>  
                  <li>E-Mail-Adresse (nur wenn Information zu den Ergebnissen der Umfrage gewünscht ist)</li>
                </ul></p>
                <p style="margin-bottom: 0in; text-align:justify; line-height: 108%">Die erhobenen Daten
                werden nicht an Dritte weitergegeben bzw. übermittelt und nur im
                internen Universitätsnetz (Server des ILR) gespeichert.</p>
                <p style="margin-bottom: 0in; text-align: justify; line-height: 108%">Die Daten werden bei
                dem Institut für Lebensmittel- und Ressourcenökonomik für die
                Dauer des Zwecks der Datenerhebung gespeichert und können nur von
                dazu berechtigten Personen eingesehen werden. Nach Wegfall des Zwecks
                werden die Daten gelöscht.</p>
                <p style="margin-bottom: 0in; line-height: 108%"><br/></p>
                <p style="margin-bottom: 0in; line-height: 108%"><font size="3" style="font-size: 12pt"><b>Nutzerrechte:</b></font></p>
                <p style="margin-bottom: 0in; text-align: justify; line-height: 108%">Die bzw. der
                Unterzeichnende hat das Recht, diese Einwilligung jederzeit ohne
                Angabe einer Begründung mit
                Wirkung für die Zukunft zu widerrufen. Weiterhin können die
                erhobenen Daten bei Bedarf korrigiert,
                gelöscht oder deren Erhebung eingeschränkt werden. Auf Anfrage kann
                unter der untenstehenden
                Adresse eine detaillierte Auskunft über den Umfang der vorgenommenen 
                Datenerhebung verlangt werden. Auch kann eine Datenübertragung angefordert 
                werden sollte die bzw. der
                Unterzeichnende eine Übertragung ihrer bzw. seiner Daten an eine
                dritte Stelle wünschen. Es kann bei Verstößen gegen den
                Datenschutz zudem Beschwerde bei der Aufsichtsbehörde erhoben werden.</p>
                <p style="margin-bottom: 0in; line-height: 108%"><br/></p>
                <p style="margin-bottom: 0in; line-height: 108%"><font size="3" style="font-size: 12pt"><b>Freiwilligkeit
                / Folgen des Nicht-Unterzeichnens:</b></font></p>

                <p style="margin-bottom: 0in;text-align: justify; line-height: 108%">Die Einwilligung zur
                Datenverarbeitung erfolgt freiwillig. Die bzw. der Unterzeichnende
                hat das Recht, dieser
                Einwilligungserklärung nicht zuzustimmen. Da für den o.g. Zweck die
                Erhebung und Verarbeitung der
                Daten erforderlich ist, können die entsprechenden Dienstleistungen
                in der Folge in diesem Fall nicht in Anspruch genommen werden.</p>
                <p style="margin-bottom: 0.11in; line-height: 108%"><br/></p>

                <font size="3" style="font-size: 12pt"><b>Zustimmung durch die
                betroffene Person:</b></font>
                <p style="margin-bottom: 0in; text-align: justify; line-height: 108%">Zur Verwendung,
                Speicherung und Nutzung meiner o.g. persönlichen Daten, erteile ich
                meine Einwilligung i.S.v.
                Art. 6 Abs. 1 lit. a) DS-GVO, die ich jederzeit ohne Angabe von
                Gründen mit Wirkung für die
                Zukunft widerrufen kann. Hiermit erkläre ich, über meine Rechte
                belehrt worden zu sein.</p>
                <br/>
                <p style="font-size: 12pt"><b>Kontakt:</b></p>
                <ul>
                  <li><p style="margin-bottom: 0in; line-height: 108%"><b>Beschwerden,
                  Auskunftsanfragen und andere Anliegen sind an folgende Stelle zu
                  richten:</b></p>
                  <p style="margin-bottom: 0in; line-height: 108%"><i>Anna Massfeller</i>
                  <br>Junior
                  Research Group of Hugo Storm “Data science in agricultural economics”
                  <br>Niebuhrstraße 1a, 53113 Bonn
                  <br>
                  E-mail: <a href="mailto:anna.massfeller@ilr.uni-bonn.de" style="color: #1adee8">anna.massfeller@ilr.uni-bonn.de</a></p>
                  </li>
                <li>
                  <p style="margin-bottom: 0in; line-height: 108%"><b>Zuständiger Datenschutzbeauftragter der Universität Bonn:</b></p>
                  <p style="margin-bottom: 0in; line-height: 108%"><i>Dr. Jörg Hartmann</i>
                  <br>
                  Genscherallee 3, 53113 Bonn
                  <br>
                  E-mail: <a href="mailto:joerg.hartmann@uni-bonn.de" style="color: #1adee8">joerg.hartmann@uni-bonn.de</a>
                  <br>
                  <a href="tel:+49228736758" style="color: #1adee8">+ 49 (0)228 -73 -6758</a>
                  <br> 
                  <a href="https://www.datenschutz.uni-bonn.de/" target="https://www.datenschutz.uni-bonn.de" style="color: #1adee8">https://www.datenschutz.uni-bonn.de</a></p>
                </li>
                <p style="margin-bottom: 0in; line-height: 108%"></p>
                <li>
                  <p style="margin-bottom: 0in; line-height: 108%"><b>Zuständige
                  Aufsichtsbehörde:</b></p>
                  <p style="margin-bottom: 0in; line-height: 108%"><i>Landesbeauftragte
                  für Datenschutz und Informationsfreiheit Nordrhein-Westfalen</i>
                  <br>Postfach 20 04 44, 40102 Düsseldorf</p>
                  <br>
              </li>
              </ul>
                </div>
                </div>
                <h3>Datenschutzerklärung Akzeptieren:<input
                type="checkbox"
                true-value="yes"
                false-value="no"
                v-model="surveyData.consent"
                /></h3>
            </section> 
         <button @click.prevent="prev()" @click="scrollToTop()">Zurück</button>
         <button @click.prevent="next({consent: 'consent'})" @click="scrollToTop()">Weiter</button>
        </div>

        <div v-if="step === 2">
            <h1>Frage {{ pageNumber }} / 8</h1>
            <div>
            <modal
             hideModal = true; helpText="Sie müssen diese Frage beantworten um fortfahren zu können.">
            </modal>
            </div>
            <br>
              <section>
                <legend for="question1">
                  Betreiben Sie mechanische Unkrautbekämpfung in Ihren Zuckerrüben? 
                  Dazu zählt auch chemisch-mechanisch kombinierte Unkrautbekämpfung wie eine Hacke-Bandspritze. 
                  Die Handhacke zählt in diesem Fall NICHT als mechanische Unkrautbekämpfung.
                
                </legend>
                <hr>
                <br />
                <input
                  type="radio"
                  value="Ja"
                  v-model="surveyData.question1"
                />
                <label for="one">Ja</label>
                <br />
                <input 
                type="radio" 
                value="Nein" 
                v-model="surveyData.question1" 
                />
                <label for="one">Nein</label>
                <br />
            </section>
              
          <button @click.prevent="prev()" @click="scrollToTop()">Zurück</button>
          <button @click.prevent="next()" @click="pageNumber+=1; scrollToTop()">Weiter</button>
           <br />  
              
        </div>

    <div v-if="step === 3 && surveyData.question1 ==='Nein'">
          <h1>Frage {{ pageNumber }} / 8</h1>
          <modal 
          hideModal = true; helpText="Bitte geben Sie uns einige Hintergundinformationen zu Ihrer Entscheidung.">
          </modal>
          <br>
          <div>
            <legend for="question2_alt"> 
              Warum nutzen Sie keine mechanische Unkrautbekämpfung? Wählen Sie alle passenden Gründe aus.Sie haben außerdem die Möglichkeit weitere Gründe oder Erklärungen im Kommentarfeld einzutragen.
            </legend>
              <hr>
              <br />
          </div>

          <input type="checkbox" name="pets" value="1" v-model="surveyData.question2_alt.select" > Zu hohe laufende Kosten<br>
          <input type="checkbox" name="pets" value="1" v-model="surveyData.question2_alt.select" > Zu hohe Investitionskosten<br>
          <input type="checkbox" name="pets" value="1" v-model="surveyData.question2_alt.select" > Zu hoher Zeitaufwand<br>
          <input type="checkbox" name="pets" value="2" v-model="surveyData.question2_alt.select" > Geringe Zuverlässigkeit in der Unkrautbekämpfung<br>
          <input type="checkbox" name="pets" value="3" v-model="surveyData.question2_alt.select" > Hohes Risiko die Kulturpflanze zu schädigen<br>
          <input type="checkbox" name="pets" value="7" v-model="surveyData.question2_alt.select" > Nicht möglich auf meinem Betrieb (z. Bsp. durch Bodenbedingungen, Feldgrößen, …)<br>
          <input type="checkbox" name="pets" value="9" v-model="surveyData.question2_alt.select" > Ich weiß nicht, ob die Technik bei mir funktioniert<br>         
          <input type="checkbox" name="pets" value="11" v-model="surveyData.question2_alt.select" > Ich traue mir die Anwendung/Bedienung nur bedingt zu<br>
          <input type="checkbox" name="pets" value="8" v-model="surveyData.question2_alt.select" > Meine Kollegen in der Region haben schlechte Erfahrungen gemacht und mir davon erzählt<br>
          <input type="checkbox" name="pets" value="10" v-model="surveyData.question2_alt.select" > Ich kenne keine Kollegen in meiner Region der mir Tipps geben könnten<br>
          <input type="checkbox" name="pets" value="12" v-model="surveyData.question2_alt.select" > Ich möchte noch warten bis die Technik ausgereifter ist<br>
          <input type="checkbox" name="pets" value="13" v-model="surveyData.question2_alt.select" > Es gibt für mich keinen Grund für eine Umstellung meines Anbaus<br>
          <br/>
          <div class="form-group">
            <label>Kommentar: </label>
            <textarea class="form-control"
                      style="width: 500px"
                      v-model="surveyData.question2_alt.comment"
                      placeholder="Eure Kommentare hier einfügen"
                      required
                      id="question2_alt"
                      rows="3">
            </textarea>
          </div>
            <br>
            <br>
          <button @click.prevent="prev()" @click="pageNumber-=1; scrollToTop()">Zurück</button>
          <button @click.prevent="next()" @click="pageNumber+=1; scrollToTop()">Weiter</button>
      </div>

    <div v-if="step === 3 && surveyData.question1 ==='Ja'">
          <h1>Frage {{ pageNumber }} / 8</h1>
          <modal 
          hideModal = true; helpText="Bitte wählen Sie eine Maschine aus. Füllen Sie dann die entsprechenden Spalten in der Tabelle aus. 
                                      Sie können Maschinen hinzufügen, die nicht in der Liste stehen oder auch wieder entfernen.">
          </modal>
          <br>
          <section>
            <legend for="question2"> 
              Seit wann nutzen Sie die folgenden Techniken? 
            </legend>
              <hr>
              <br />
              <br />
                <div style="width: 400px">   
                  <multiselect v-model="surveyData.question2.technique" 
                              :multiple="true"
                              :options="options"
                              :close-on-select="true"
                              :clear-on-select="false"
                              placeholder="Auswahl"  
                              selectLabel= "zum Auswählen anklicken"
                              selectedLabel="Ausgewählt" 
                              deselect-label="zum Entfernen anklicken" 
                              :preserve-search="false"
                              :max-height="300"
                              :searchable="false"
                              >
                    </multiselect> 
                </div>
          </section>
          <br/>
          <section>
             <label style="font-size: 14px"  for="question2_add">Andere Techniken, die nicht in der Liste stehen, können Sie hier hinzufügen:&nbsp;&nbsp;</label>
            <div style="display:flex; flex-direction: row; justify-content: left  ; align-items: center">
            <input id="question2_add"
                type="text"
                required
                v-model="surveyData.question2_add"
                placeholder="andere Technicken hier hinfügen"
                pattern="[aA-Zz]">
            <button @click.prevent="surveyData.question2.technique.push(surveyData.question2_add)">
            Hinzufügen
            </button>
            </div>
          </section>
          <br/>
          <table class="table table-success table-striped table-bordered" id="techniqueTable" 
          align="center" style="border:2px solid black; border-style: solid">
            <thead>
              <tr>
                <th scope="col">Gerät</th>
                <th scope="col">Seit</th>
                <th scope="col">Zusatzausstattung/ Investition/ Kommentare 
                  <i class="fa fa-question-circle" aria-hidden="true" 
                  data-toggle="tooltip" data-placement="bottom" 
                  title="Hat die Maschine eine besondere Ausstattung? Haben Sie das Gerät in der Vergangenheit durch ein neues ersetzt? Ist das Gerät autonom fahrend? Haben Sie vielleicht selbst etwas angebaut? Dann nutzen Sie bitte das Kommentarfeld."
                  style="font-size:22px;color:#87cefa">
                  </i>
                </th>
                 <th scope="col">Wem gehört die aktuell genutzte Maschine?</th>
              </tr>
            </thead>
            <tbody>
                <tr v-for="(method, index) in surveyData.question2.technique" :key="index">
                  <td>{{method}}
                    <button style="width:23px; height:23px"  class="button close-icon" @click.prevent="deleteEntryTechnique(index)"></button>
                  </td>  
                  <td>          
                    <div>
                      <input 
                      minlength="4" 
                      maxlength="4"  
                      size="4"
                      placeholder="Jahr"                
                      inputmode="numeric"                 
                      type="text" 
                      required
                      oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"
                      style="width:40%; height: 10%"
                      v-model="surveyData.question2.timeframe[index]"
                      > 
                    </div>
                  </td> 
                 <td>
                     <div>
                        <div>
                          <label>a) Mit Kamera seit: </label>
                        </div>
                        <div>
                          <input 
                            minlength="4" 
                            maxlength="4"  
                            size="4"
                            placeholder="Jahr"               
                            inputmode="numeric"                 
                            type="text" 
                            required
                            style="width:40%; height: 10%"
                            oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"
                          v-model="surveyData.question2.camera[index]"
                          > 
                        </div>
                      </div>
                      <hr>
                      <div>
                        <div>
                          <label>b) Mit GPS seit: </label>
                        </div>
                        <div>
                          <input 
                           minlength="4" 
                            maxlength="4"  
                            size="4"
                            placeholder="Jahr"
                            inputmode="numeric"                 
                            type="text" 
                            required
                            style="width:40%; height: 10%"
                            oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"
                          v-model="surveyData.question2.gps[index]"
                          > 
                        </div>
                      </div>
                      <hr>
                      <div>
                        <div>
                          <label>c) Neuinvestition in: </label>
                        </div>
                        <div>
                          <input
                            minlength="4" 
                            maxlength="4"  
                            size="4"
                            placeholder="Jahr"                
                            inputmode="numeric"                 
                            type="text" 
                            required
                            style="width:40%; height: 10%"
                            oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"
                          v-model="surveyData.question2.newInvest[index]"
                          > 
                        </div>
                      </div>
                      <hr>
                      <div>
                      <label for="one">d) Autonom fahrend seit: </label>
                      <input
                      minlength="4" 
                      maxlength="4"  
                      size="4"
                      placeholder="Jahr"                
                      inputmode="numeric"                 
                      type="text" 
                      required
                      style="width:40%; height: 10%"
                      oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"
                      v-model="surveyData.question2.autonom[index]"
                      />
                      </div>
                      <hr>
                      <div>
                        <div>
                          <label>e) Kommentar: </label>
                        </div>
                        <div>
                          <input style="height:30%; width: 70%"
                          type="text"
                          v-model="surveyData.question2.comment[index]"
                          placeholder="Hier einfügen"
                          required>
                        </div>
                      </div>
                      <hr>
                       <div>
                      <label for="one">f) Keine Angabe</label>
                      <input
                      id="one"
                      type="checkbox"
                      true-value="yes"
                      false-value="no"
                      v-model="surveyData.question2.not_available[index]"
                      />
                      </div>
                  </td>
                  <td>
                    <input
                      type="radio"
                      value="own"
                      v-model="surveyData.question2.mashine[index]"
                      />
                      <label>Eigene Maschine</label>
                      <br />
                      <input 
                      type="radio" 
                      value="shared"
                      v-model="surveyData.question2.mashine[index]" 
                      />
                      <label>Teile mit Nachbarn</label>
                      <br />
                      <input 
                      type="radio" 
                      value="maschinenring"
                      v-model="surveyData.question2.mashine[index]" 
                      />
                      <label>Maschinenring</label>
                      <br />
                      <input 
                      type="radio" 
                      value="lohnunternehmer"
                      v-model="surveyData.question2.mashine[index]" 
                      />
                      <label>Lohnunternehmer</label>
                      <br />
                      <hr>
                      <div>
                        <div>
                          <label>Andere: </label>
                        </div>
                        <div>
                          <input style="height:30%; width: 70%"
                          type="text"
                          v-model="surveyData.question2.other_machine[index]"
                          placeholder="Hier einfügen"
                          required>
                        </div>
                      </div>
                </td>
              </tr>   
            </tbody>
          </table>
          <button @click.prevent="deleteRowTechnique()">Alle löschen</button>
          <button @click.prevent="prev()" @click="pageNumber-=1;scrollToTop()">Zurück</button>
          <button @click.prevent="next()" @click="pageNumber+=1;scrollToTop()">Weiter</button>
        </div>

      
       <div v-if="step === 4">  

            <h1>Frage {{ pageNumber }} / 8</h1>
            <modal 
            hideModal = true; helpText="Hierbei sind nicht nur Zuckerrübenbauern gemeint. 
            Die Handhacke zählt in diesem Fall NICHT als mechanische Unkrautbekämpfung">
            </modal>
            <br>            
            <section>
              <legend for="question3">
                  Mit wie vielen Landwirten, die mechanische oder chemisch-mechanisch kombinierte Unkrautbekämpfung <mark style="color: #1adee8; background: none">(nicht nur in Zuckerrüben!)</mark> einsetzen, stehen Sie in persönlichem Kontakt?
                  <br>
                  Hierbei sind nicht nur Landwirte gemeint, die man täglich spricht, sondern auch Landwirte mit denen man sich telefonisch oder zum Beispiel auf Messen, bei Arbeitskreistreffen, durch Anbauverbände und bei Feldbegehungen austauscht
              </legend>
              <hr>
              <br />
                <input
                  type="radio"
                  value="0"
                  v-model="surveyData.question3"
                />
                <label for="one">0</label>
                <br />
                <input 
                type="radio" 
                value="1-5" 
                v-model="surveyData.question3" 
                />
                <label for="one">1-5</label>
                <br />
                <input 
                type="radio" 
                value="6-10" 
                v-model="surveyData.question3" 
                />
                <label for="one">6-10</label>
                <br />
                <input 
                type="radio" 
                value="mehr als 10" 
                v-model="surveyData.question3" 
                />
                <label for="one">mehr als 10</label>
                <br />
            </section>

              <button @click.prevent="prev()" @click="pageNumber-=1; scrollToTop()">Zurück</button>
              <button @click.prevent="next();" @click="pageNumber+=1; setColor(); scrollToTop()">Weiter</button>      
        </div>

      <div v-if="step === 5 || step === 6">
       <div v-if="step === 5 && skip_map == false">
          <h1>Frage {{ pageNumber }} / 8</h1>
            <modal 
              hideModal = true; helpText=" Bitte markieren Sie die entsprechende Lage auf der Karte. Sie können die Karte verschieben, 
              indem Sie die linke Maustaste gedrückt halten. Für unsere Auswertung ist eine möglichst präzise Angabe hilfreich. Sie können im Suchfeld oben rechts in der Ecke der Karte nach Orten suchen.">
           </modal>
           <br>          
              <legend for="question4">
                 Auf welchen Feldern haben Sie im letzten Wirtschaftsjahr (2021) Zuckerrüben angebaut? Bitte klicken Sie die entsprechenden Felder an bzw. setzen Sie den Marker.
                <br>
                <br>
                Um Ihnen die Auswahl zu erleichtern haben wir die Felder umrandet und jene gelb markiert, von denen wir wissen, dass dort in den letzten drei Wirtschaftsjahren (2019-2021) Zuckerrüben angebaut wurden. Sie haben außerdem die Möglichkeit auch nicht umrandete Flächen (gilt vor allem für Hamburg und das Saarland) mit Hilfe eines kleinen Traktor-Symbols zu markieren.
                <br>
                <br>
                Die Daten für NRW, Niedersachsen und Brandenburg stammen aus der frei zugänglichen Invekos-Datenbank (mehr dazu <a href="https://www.zi-daten.de/" target="_blank" rel="noopener noreferrer" style="color: #1adee8; background: none;">hier</a>) und die Daten für die anderen Bundesländer aus Fernerkundungsdaten (automatisch erkannte Feldumrandungen aus Satellitenbildern etc.).
                Es kann daher zu Abweichungen in der Umrandung der Felder kommen, wählen Sie daher einfach den/ die am besten passendsten Schlag/ Schläge aus. 
                Die Umrandung wird erst sichtbar, wenn sie an die Felder heranzoomen. Wenn Sie keine Flächen anklicken möchten, können Sie diese Frage auch überspringen und im nächsten Schritt Ihre Postleitzahl angeben.
              </legend>    
              <hr>
              <br />
           
          <div>
              <button @click.prevent="prev()" @click="pageNumber-=1; scrollToTop()">Zurück</button>
              <button @click.prevent="next()" @click="pageNumber+=1; setColor(); scrollToTop()">Weiter</button>
              <button @click.prevent="skip_map = true">Überspringen</button>
          </div>
      </div>

      <div v-if="step === 5 && skip_map == true">
          <h1>Frage {{ pageNumber }} / 8</h1>
          <modal 
            hideModal = true; helpText="Diese Information wird anonym gespeichert und es können keine Rückschlüsse auf einzelne Betriebe gezogen werden. 
                                        Alle Daten werden später aggregiert und wie am Anfang auf der Karte zusammengefasst">
          </modal>
          <br>          
          <legend for="question4_alt">
               <br/>
               Bitte geben Sie Ihre Postleitzahl an: 
              </legend>
              <hr>
              <br />
              <div> 
                    <input  
                    minlength="5" 
                    maxlength="5"  
                    size="5"                
                    inputmode="numeric"                 
                    type="text" 
                    required
                    oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"
                    v-model="surveyData.question4_alt" 
                    >
                </div>
                <br/>
                <br/>
           <div>
              <button @click.prevent="skip_map = false" @click="scrollToTop()">Zurück</button>
              <button @click.prevent="next()" @click="pageNumber+=1; setColor(); scrollToTop()">Weiter</button>
          </div>
      </div>

      <div v-if="step === 6  && skip_map2 == false">
          <h1>Frage {{ pageNumber }} / 8</h1>
           <modal 
            hideModal = true; helpText="Bewegen Sie die Karte in dem Sie den linken Mauszeiger gedrückt halten.">
          </modal>
          <br>          
          <section>
            <legend>
              Welche Felder sind Ihnen bekannt (zum Beispiel durch Vorbeifahren), auf denen im letzten Wirtschaftsjahr (2021) mechanische oder chemisch-mechanisch kombiniert Unkrautbekämpfung angewandt wurde?
              <mark style="color: #1adee8; background: none">Hierbei sind nicht nur Zuckerrübenfelder gemeint!</mark> 
              <br>
              <br>
              Bitte klicken Sie diese Felder auf der Karte an.
              Wenn Sie nicht genau wissen, wo die Flächen liegen, können Sie diese Frage auch überspringen und im nächsten Schritt eine ungefähre Anzahl und Entfernung angeben. 
            </legend>
            <hr>  
            <br /> 
          </section>
          <button @click.prevent="prev()" @click="pageNumber-=1; setColor(); scrollToTop()">Zurück</button>
          <button @click.prevent="next()" @click="pageNumber+=1; scrollToTop()">Weiter</button>
          <button @click.prevent="skip_map2 = true">Überspringen</button>   
      </div>
      <div v-if="step === 6 && skip_map2 == true">
      <h1>Frage {{ pageNumber }} / 8</h1>
      <modal 
      hideModal = true; helpText="Bitte geben Sie möglichst genau an, wo und wie viele Felder Sie zum Beispiel im Vorbeifahren beobachten.">
      </modal>
      <br>      
      <section>
        <div style="margin: 5px; padding: 5px; border: 4px solid black;">
          <legend>
           a) Wie viele Felder kennen Sie, auf denen Unkraut mechanisch oder chemisch-mechanisch kombiniert bekämpft wird?             
        </legend>
              <hr>
              <br>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="0" v-model="surveyData.question5_alt.fields">
              <label class="form-check-label">0</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="1-5" v-model="surveyData.question5_alt.fields">
              <label class="form-check-label">1-5</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="6-10" v-model="surveyData.question5_alt.fields">
              <label class="form-check-label">6-10</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="11-15" v-model="surveyData.question5_alt.fields">
              <label class="form-check-label">11-15</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="mehr als 15" v-model="surveyData.question5_alt.fields">
              <label class="form-check-label">mehr als 15</label>
          </div>              
        </div>              
      </section>
        
      <section>
        <div style="margin: 5px; padding: 5px; border: 4px solid black;">
        <legend for="question5_alt">
        b) In welchem Umkreis liegen diese Felder?
        </legend>
        <hr>
        <br>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="0-5 km" v-model="surveyData.question5_alt.distance">
              <label class="form-check-label">0-5 km</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="6-10 km" v-model="surveyData.question5_alt.distance">
              <label class="form-check-label">6-10 km</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="11-15 km" v-model="surveyData.question5_alt.distance">
              <label class="form-check-label">11-15 km</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="16-20 km" v-model="surveyData.question5_alt.distance">
              <label class="form-check-label">16-20 km</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="21-30 km" v-model="surveyData.question5_alt.distance">
              <label class="form-check-label">21-30 km</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="mehr als 30 km" v-model="surveyData.question5_alt.distance">
              <label class="form-check-label">mehr als 30 km</label>
          </div>
        </div>
      </section>
        <button @click.prevent="skip_map2 = false" @click="scrollToTop()">Zurück</button>
        <button @click.prevent="next()" @click="pageNumber+=1; scrollToTop()">Weiter</button>
    </div>  
     <div style="border: 4px solid black">
        <!-- Maps component embedding -->
        <keep-alive>
          <markermapbox v-bind:marked-farm="currentFarm" @map_clicked="setGeolocation"/>
        </keep-alive>
    </div>
  </div>

   <div v-if="step === 7">
        <h1>Frage {{ pageNumber }} / 8</h1>
            <modal 
            hideModal = true; helpText="Help text here?">
           </modal>
           <br>          
          <section>
          <legend>
           Können Sie sich vorstellen in Zukunft mechanische Unkrautbekämpfung einzusetzen?
           <br>
          Bewerten Sie folgende Techniken im Hinblick auf die 5 Aussagen. Wählen Sie jeweils die Aussage/n, die am besten zu Ihrer derzeitigen Planung passt/passen.
        </legend>
        <hr>
        <br>
        </section>
          <div class="table-responsive">
            <table class="table table-hover">
              <thead style="background-color: #182f4e">
                <tr>
                  <th>Herkömmliche Maschinen zur mechanischen (z.B. Striegel, Hack) oder chemisch-mechanisch kombinierten (z.B. Hacke-Bandspritze) Unkrautbekämpfung (Ohne GPS/ Kamerasteuerung)</th>
                  <th>GPS- /kameragesteuerte, <b>gezogene</b> Maschinen zur mechanischen/ chemisch-mechanisch kombinierten Unkrautbekämpfung (nicht autonom fahrend)</th>
                  <th>GPS-/ kameragesteuerte <b>autonom</b> fahrende Maschinen zur mechanischen/ chemisch-mechanisch kombinierten Unkrautbekämpfung (z.Bsp. Roboter)</th>
                </tr>
              </thead>
              <tbody style="font-size:12px">
                <tr>
                  <td>
                    <label for="radio1"><input type="radio" value="1" v-model="surveyData.question6.column1" />Ich plane nichts in diese Richtung</label>
                    <hr>
                    <label for="radio1"><input type="radio" value="2" v-model="surveyData.question6.column1" />Ich plane mich zu informieren und aktuelle Diskussionen und die Fachliteratur zu dem Thema zu verfolgen</label>  
                    <hr>
                    <label for="radio1"><input type="radio" value="3" v-model="surveyData.question6.column1" />Ich plane aktiv innerhalb der nächsten 5 Jahren Angebote einzuholen und Beratungsmöglichkeiten anzunehmen</label>
                    <hr>
                    <label for="radio1"><input type="radio" value="4" v-model="surveyData.question6.column1" />Ich plane diese Technik innerhalb der nächsten 5 Jahren einzusetzen (Eigene Anschaffung, Lohnunternehmer, ...)</label>
                    <hr>
                    <label for="radio1"><input type="radio" value="5" v-model="surveyData.question6.column1" />Ich setze diese Technik schon ein</label>
                  </td>
                  <td>
                    <label for="radio1"><input type="radio" value="1" v-model="surveyData.question6.column2" />Ich plane nichts in diese Richtung</label>
                    <hr>
                    <label for="radio1"><input type="radio" value="2" v-model="surveyData.question6.column2" />Ich plane mich zu informieren und aktuelle Diskussionen und die Fachliteratur zu dem Thema zu verfolgen</label>  
                    <hr>
                    <label for="radio1"><input type="radio" value="3" v-model="surveyData.question6.column2" />Ich plane aktiv innerhalb der nächsten 5 Jahren Angebote einzuholen und Beratungsmöglichkeiten anzunehmen</label>
                    <hr>
                    <label for="radio1"><input type="radio" value="4" v-model="surveyData.question6.column2" />Ich plane diese Technik innerhalb der nächsten 5 Jahren einzusetzen (Eigene Anschaffung, Lohnunternehmer, ...)</label>
                    <hr>
                    <label for="radio1"><input type="radio" value="5" v-model="surveyData.question6.column2" />Ich setze diese Technik schon ein</label>
                  </td>
                  <td>
                    <label for="radio1"><input type="radio" value="1" v-model="surveyData.question6.column3" />Ich plane nichts in diese Richtung</label>
                    <hr>
                    <label for="radio1"><input type="radio"  value="2" v-model="surveyData.question6.column3" />Ich plane mich zu informieren und aktuelle Diskussionen und die Fachliteratur zu dem Thema zu verfolgen</label>  
                    <hr>
                    <label for="radio1"><input type="radio"  value="3" v-model="surveyData.question6.column3" />Ich plane aktiv innerhalb der nächsten 5 Jahren Angebote einzuholen und Beratungsmöglichkeiten anzunehmen</label>
                    <hr>
                    <label for="radio1"><input type="radio" value="4" v-model="surveyData.question6.column3" />Ich plane diese Technik innerhalb der nächsten 5 Jahren einzusetzen (Eigene Anschaffung, Lohnunternehmer, ...)</label>
                    <hr>
                    <label for="radio1"><input type="radio" value="5" v-model="surveyData.question6.column3" />Ich setze diese Technik schon ein</label>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
      <button @click.prevent="prev()" @click="pageNumber-=1;scrollToTop()">Zurück</button>
      <button @click.prevent="next()" @click="pageNumber+=1;scrollToTop()">Weiter</button>
  </div>
    
    <div v-if="step === 8">
        <h1>Frage {{ pageNumber }} / 8</h1>
        <modal 
        hideModal = true; helpText="Diese Daten dienen zur Erfassung der Repräsentativität unserer Umfrage und werden, wie die gesamte Umfrage, anonymisiert erfasst.">
        </modal>
        <h2 style="text-align: center">Persönliche und betriebliche Angaben</h2>     
        <section>
        <div style="margin: 5px; padding: 5px; border: 4px solid black;">
          <legend for="question7">
              A) Wie alt sind Sie?
          </legend>
              <hr>
              <br />
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="15-24" v-model="surveyData.question7.age">
              <label class="form-check-label">15-24</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="25-34" v-model="surveyData.question7.age">
              <label class="form-check-label">25-34</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="35–44" v-model="surveyData.question7.age">
              <label class="form-check-label">35–44</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="45-54" v-model="surveyData.question7.age">
              <label class="form-check-label">45-54</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="55-64" v-model="surveyData.question7.age">
              <label class="form-check-label">55-64</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="65 und mehr" v-model="surveyData.question7.age">
              <label class="form-check-label">65 und mehr</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="keine Angabe" v-model="surveyData.question7.age">
              <label class="form-check-label">keine Angabe</label>
          </div>
          <br />
          </div>
        </section>

        <section>
          <div style="margin: 5px; padding: 5px; border: 4px solid black;">
          <legend for="question7">
              B) Wie groß ist Ihr Betrieb (in ha)?
          </legend>
              <hr>
              <br />
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="unter 5" v-model="surveyData.question7.size">
              <label style="display:inline-block" class="form-check-label">unter 5</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="5-9" v-model="surveyData.question7.size">
              <label style="display:inline-block" class="form-check-label">5-9</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="10-19" v-model="surveyData.question7.size">
              <label style="display:inline-block" class="form-check-label">10-19</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="20-49" v-model="surveyData.question7.size">
              <label style="display:inline-block" class="form-check-label">20-49</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="50-99" v-model="surveyData.question7.size">
              <label style="display:inline-block" class="form-check-label">50-99</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="100-199" v-model="surveyData.question7.size">
              <label style="display:inline-block" class="form-check-label">100-199</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="200–499" v-model="surveyData.question7.size">
              <label style="display:inline-block" class="form-check-label">200–499</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="500-999" v-model="surveyData.question7.size">
              <label style="display:inline-block" class="form-check-label">500-999</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="1000 und mehr" v-model="surveyData.question7.size">
              <label style="display:inline-block" class="form-check-label">1000 und mehr</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="keine Angabe" v-model="surveyData.question7.size">
              <label style="display:inline-block" class="form-check-label">keine Angabe</label>
          </div>
          <br />
         </div>
        </section>
     
        <section>
          <div style="margin: 5px; padding: 5px; border: 4px solid black;">        
          <legend for="question7">
            C) Wie bewirtschaften Sie Ihren Betrieb?
          </legend>
              <hr>
              <br />
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="konventionell" v-model="surveyData.question7.farm">
              <label style="display:inline-block" class="form-check-label">konventionell</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="gesamter Betrieb ökologisch" v-model="surveyData.question7.farm">
              <label style="display:inline-block" class="form-check-label">gesamter Betrieb ökologisch</label>
          </div>
          <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="Ackerbau ökologisch" v-model="surveyData.question7.farm">
              <label style="display:inline-block" class="form-check-label">Ackerbau ökologisch</label>
          </div>
           <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" 
               value="andere Bereiche ökologisch" v-model="surveyData.question7.farm">
              <label style="display:inline-block" class="form-check-label">andere Bereiche ökologisch</label>
          </div>
          <br />
        </div>
      </section>

        <section>
          <div style="margin: 5px; padding: 5px; border: 4px solid black;">
          <legend for="question7">
            D) Wie ist Ihr Betrieb ausgerichtet?<br>
          </legend>
              <hr>
              <br />
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" 
                value="Vornehmlich Ackerbau" v-model="surveyData.question7.orientation.choice">
                <label style="display:inline-block" class="form-check-label">Vornehmlich Ackerbau</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" 
                value="Vornehmlich Viehhaltung" v-model="surveyData.question7.orientation.choice">
                <label style="display:inline-block" class="form-check-label">Vornehmlich Viehhaltung</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" 
                value="Vornehmlich Sonderkulturen" v-model="surveyData.question7.orientation.choice">
                <label style="display:inline-block" class="form-check-label">Vornehmlich Sonderkulturen</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" 
                value="Gemischtbetrieb" v-model="surveyData.question7.orientation.choice">
            <label style="display:inline-block" class="form-check-label">Gemischtbetrieb</label>
          </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" 
                value="andere" v-model="surveyData.question7.orientation.choice">
            <label style="display:inline-block" class="form-check-label">Andere/Kommentar</label>
          </div>
              <div v-if="surveyData.question7.orientation.choice=='andere'">  
            <textarea class="form-control"
                      style="width: 400px; height: 80px"
                      v-model="surveyData.question7.orientation.comment"
                      placeholder="Andere hier einfügen"
                      required
                      >
            </textarea>
            </div>
          </div>
          <br />
        </section>
        <button @click.prevent="prev()" @click="pageNumber-=1;scrollToTop()">Zurück</button>
        <button @click.prevent="next()" @click="pageNumber+=1;scrollToTop()">Weiter</button>
    </div>

    <div v-if="step === 9">
        <h1>Frage {{ pageNumber }} / 8</h1>
        <modal 
        hideModal = true; helpText="Teilen Sie uns Ihre Gedanken zu dieser Umfrage und zum Thema mechanische Unkrautbekämpfung mit.">
        </modal>
        <br>        
        <section>
          <legend for="question8">
            Haben Sie Fragen oder Kommentare? Hier ist Platz dafür:
          </legend>
              <hr>
              <br />
          <div class="form-group">
            <textarea class="form-control"
                      style="width: 500px"
                      v-model="surveyData.question8"
                      placeholder="Fragen oder Kommentare hier hinfügen"
                      required
                      id="question8"
                      rows="3">
            </textarea>
          </div>
          <br />
        </section>

        <button @click.prevent="prev()" @click="pageNumber-=1;scrollToTop()">Zurück</button>
        <button @click.prevent="next()" @click="scrollToTop()">Weiter</button>
    </div>
 
    <div v-if="step === 10">
      <h1>Ende</h1>
      <div style="margin: 5px; padding: 5px; border: 4px solid black;">
      <section>
            <p>
            Vielen Dank, dass Sie sich die Zeit genommen haben, an der Umfrage teilzunehmen.
            </p>
            <p>
            Sie haben nun die Möglichkeit bei unserem Gewinnspiel mitzumachen.
            Unter je 100 Teilnehmer/innen verlosen wir drei Gutscheine für Engelbert Strauss im Wert von 50 €.
            Dazu können Sie unten Ihre E-Mail-Adresse angeben. Diese wird getrennt von Ihren Angaben gespeichert und es kann keine Verbindung zu Ihren Antworten hergestellt werden.
            Sie werden dann lediglich über die Ergebnisse/ das Gewinnspiel informiert. Ansonsten erhalten Sie keine E-Mails von uns.
            </p>
            <p>
            Wenn Sie möchten, senden wir Ihnen auch die zusammengefassten Ergebnisse der Studie zu.
            </p>
      </section>
      </div>
       <div style="margin: 5px; padding: 5px; border: 4px solid black;">
      <section>
        <p>
            Möchten Sie die zusammengefassten Ergebnisse der Studie per Mail erhalten?
        </p>
        <input
          type="radio"
          value="Ja"
          v-model="surveyData.question9"
        />
        <label>Ja</label>
        <br />
        <input 
        type="radio" 
        value="Nein" 
        v-model="surveyData.question9" 
        />
        <label>Nein</label>
        <br />
      </section>
      <br />

      <section>
        <p>
            Möchten Sie an dem Gewinnspiel teilnehmen?
        </p>
          <input
            type="radio"
            name="question10"
            id="question10"
            value="Ja"
            v-model="surveyData.question10"
          />
          <label for="one">Ja</label>
          <br />
          <input 
          type="radio" 
          value="Nein" 
          v-model="surveyData.question10" 
          />
          <label for="one">Nein</label>
          <br />
          <br />
      </section> 
      </div>                     
        <div style="margin: 5px; padding: 5px; border: 4px solid black;" v-if="surveyData.question9=='Ja' || surveyData.question10=='Ja'">  
            <p>
            Bitte geben Sie hier Ihre E-Mail-Adresse an. Diese Daten werden gesondert gespeichert und es besteht keine Verbindung zu Ihren Antworten in der Umfrage.
            </p>           
            <br />
            <div class="mb-3">
                <label for="farmerEmail" class="form-label"><b>E-mail Adresse:</b></label>
                <input v-model="surveyData.farmerEmail" type="email" class="form-control" aria-describedby="emailHelp" id="farmerEmail" placeholder="mueller@gmx.de" required>
                <small id="emailHelp" class="form-text text-muted">Wir werden Ihre E-Mail nicht an Dritte weitergeben.</small>
            </div>
        </div>
      <div style="margin: 5px; padding: 5px; border: 4px solid black;">
      <section>
          Bei Fragen melden Sie sich bitte bei:
          <br />
          <br />
          <i>Anna Massfeller, Doktorandin am Institut für Lebensmittel- und Ressourcenökonomik, Universität Bonn
          <br />
          E-mail: <a href="mailto:anna.massfeller@ilr.uni-bonn.de" style="color: #1adee8">anna.massfeller@ilr.uni-bonn.de</a>
          </i>
      </section>
      </div>
  <button @click.prevent="prev()">Zurück</button>
  <button @click.prevent="submit()">Abgeben</button>
  </div>

       <div v-if="step === 'done'">
          <h1>Fertig!</h1>
          <p>Vielen Dank für die Teilnahme an der Umfrage. Ihre Daten wurden nun gespeichert.</p>
          <br>
          {{ backendResponse }}
          <br>
        </div>

        <div v-if="step === 'error'">
          <h1>Oh, nein!</h1>
          <p>Es ist etwas schiefgegangen. Entschuldigung für die Unannehmlichkeit!</p>
          <br>
          <button @click.prevent="step = 1">Neu starten</button>
        </div>

      <p v-if="errors && errors.length">
        <b>Um fortfahren zu können, müssen Sie die erforderlichen Felder ausfüllen!</b>
      </p>
      <br /><br />Debug: {{surveyData}}

    </div>
    </template>

<script>

import markermapbox from '@/components/markermapbox.vue'
import modal from './modal.vue'
import heatmapbox from './heatmapbox.vue'
import multiselect from 'vue-multiselect'

var PouchDB = require('pouchdb');
let pouchDb = PouchDB.default.defaults();
let db = new pouchDb('https://fruchtfolge.agp.uni-bonn.de/db/survey_anna/', {
  skip_setup: true
})
db.info().then(info => console.log(info));


export default {
    name: 'survey',
    components: {markermapbox, modal, heatmapbox, multiselect},   
  data () {
    return {
      step: 0,
      pageNumber: 1,
      isHidden: false,
      errors: [],
      zip: null,
      skip_map: false,
      skip_map2: false,
      zip_to_geo: {},
      selected: null,
      options: ['Striegel', 'Hackstriegel', 'Reihenstriegel', 'Rotorstriegel', 'Scharhacke', 'Trennhacke', 'Rollhacke', 'Fingerhacke', 'Kombination Hacke-Bandspritze', 'Häufelgerät', 'Hackbürste', 'Hackfräse'],
      heatmap_coords: [],
      chosen_technique: "choose",
      currentFarm: '',
      surveyData: {
        _id: new Date().toISOString(),
        consent: null,
        question1: 'Ja',
        question2: {
          technique: [],
          timeframe: [],
          camera: [],
          gps: [],
          newInvest: [],
          autonom: [],
          comment: [],
          not_available:[],
          mashine: [],
          other_machine: []
        },
        question2_alt: {select: [], comment: ''},
        question2_add: null,
        question3: [],
        question4_5: {farms: [], shapes: []}, //here the farmer + neighbor coordinates are saved
        question4_alt: [],
        question5_alt: {
          distance: [],
          fields: []
        },
        question6: {column1: [], column2: [], column3: []},
        question7: {age: null, size: null, farm: null, orientation: {choice: null, comment: ''}},
        question8: '',
        question9: null,
        question10: null,
        farmerEmail: null
      }
    }
  },
  methods: {

    //-- PouchDB methods

    setGeolocation: function(markers, plots) {
      for (var i = 0; i < markers.length; i++) {
        console.log("marker" + i + markers[i]["own"]);
      }
      this.surveyData.question4_5.farms = markers


      for (var j = 0; j < plots.features.length; j++) {
        console.log("Plot" + j + plots.features[j].geometry.coordinates)

      }
      this.surveyData.question4_5.shapes = plots

    },

    getGeolocation: function() {
      var heatmap_data = []
      db.allDocs({
        include_docs: true,
        descending: true
      }).then(function(result) {
        var jsonData = result.rows
        console.log(jsonData.length)
        for (var i = 0; i < jsonData.length; i++) {

          // *** insert the techniques ***
          
          var techniques = jsonData[i].doc.question2.technique
          console.log("techniques", techniques)
          heatmap_data.push({
            technique: techniques,
            coords: []
          })

          // *** insert the plot coordinates ***

          var plot_entries = jsonData[i].doc.question4_5.shapes.features
          for (var j = 0; j < plot_entries.length; j++) {
            var plots = plot_entries[j].geometry.coordinates[0][0][0]
            var plots_coords = {'lng': plots[0], 'lat': plots[1]}
            console.log("plot", plots_coords)
            heatmap_data[i].coords.push(plots_coords)  
          }

          // *** insert the chosen farm coordinates ***

          var farm_entries = jsonData[i].doc.question4_5.farms
          for (var k = 0; k < farm_entries.length; k++) {

            if (farm_entries[k].own) {
            console.log("farm", farm_entries[k].own)
            heatmap_data[i].coords.push(farm_entries[k].own)  
          }
          }
        }
      console.log("whole_data", heatmap_data)
      }).catch(function(err) {
        console.log("error" + err)
      })
      return heatmap_data
    },
    deleteDB: function() {
      db.allDocs().then(function(result) {
        return Promise.all(result.rows.map(function(row) {
          return db.remove(row.id, row.value.rev);
        }));
      }).then(function() {
        console.log("done");
      }).catch(function(err) {
        console.log("error" + err);
      });
    },
    checkValue: function(value){
        if(value > 2022 || value < 1970) 
        { value = '' }
    },
    scrollToTop() {
    window.scrollTo(0,0);
    },
    setColor: function(){
      if (this.step === 5) {
          this.currentFarm = 'own'
          console.log(this.currentFarm)
      }
      if (this.step === 6) {
          this.currentFarm = "others"}
          console.log(this.currentFarm)
      },
    deleteEntryTechnique: function (index) {
      this.surveyData.question2.technique.splice(index, 1)
      this.surveyData.question2.timeframe.splice(index, 1)
      this.surveyData.question2.camera.splice(index, 1)
      this.surveyData.question2.gps.splice(index, 1)
      this.surveyData.question2.newInvest.splice(index, 1)
      this.surveyData.question2.autonom.splice(index, 1)
      this.surveyData.question2.comment.splice(index, 1)
      this.surveyData.question2.mashine.splice(index, 1)
      this.surveyData.question2.other_machine.splice(index, 1)
    },
    deleteRowTechnique() {
      // delete row (index-0).
      this.surveyData.question2.technique = []
      this.surveyData.question2.timeframe = []
      this.surveyData.question2.camera = []
      this.surveyData.question2.gps = []
      this.surveyData.question2.newInvest = []
      this.surveyData.question2.autonom = []
      this.surveyData.question2.comment = []
      this.surveyData.question2.mashine = []
      this.surveyData.question2.other_machine = []
    },
    prev() {
      this.step--
    },
    // those are question fields in the form, each of which is check if filled
    next(formFieldsToCheck) {
      if (formFieldsToCheck) {
        this.errors = []
        for (const field in formFieldsToCheck) {
          if (!this.surveyData[field] || !this.surveyData[field].length) {
            this.errors.push(
              `Please fill out the ${formFieldsToCheck[field]} question before continuing`
            )
          }
        }
      }
      if (!this.errors.length) {
        this.step++
      }
    },

    async postData(url = '', data = {}) {
      const response = await fetch(url, {
        method: 'POST',
        mode: 'cors',
        cache: 'no-cache',
        credentials: 'same-origin',
        headers: {
          'Content-Type': 'application/json'
        },
        redirect: 'follow',
        referrerPolicy: 'no-referrer',
        body: JSON.stringify(data)
      })
      return response.json()
    },
    async submit() {
      try {

        // send data to the backend, for testing use: "https://httpbin.org/post"

        this.backendResponse = await db.put(this.surveyData, function callback(err) {
          if (!err) {
            console.log('Successfully posted a farmer feedback!');
          }
        })

        db.changes({
          since: 'now',
          live: true
        }) // .on('change', this.showDocs());

        console.log(this.backendResponse)
        this.step = 'done'
        this.showDocs()
      } catch (e) {
        // ToDo: Handle errors
        console.error(e)
        this.step = 'error'
      }
    },
    async showDocs() {
      try {
        const {
          rows
        } = await db.allDocs({
          include_docs: true,
          descending: true
        })
        console.log(rows)
        //console.log("total rows " + rows.total_rows);
      } catch (e) {
        console.error(e)
      }
    }
  },
  // calculates the heatmap on page load
  beforeMount() {
    this.heatmap_coords = this.getGeolocation()
  }
}
</script>   
<style scoped>

#techniqueTable {
  font-size: 14px;
  font-family: Arial, Helvetica, sans-serif;
  color: rgb(255, 255, 255);
  border-collapse: collapse;
  width: 100%;
}

#techniqueTable td,
#techniqueTable th {
  border: 3px solid rgb(87, 89, 90);
  padding: 8px;
}

#techniqueTable tr:nth-child(even) {
  background-color:  #182f4e;
}

#techniqueTable tr:nth-child(odd) {
  background-color:  #1f2f42;
}

#techniqueTable tr:hover {
  background-color: rgb(43, 61, 71);
}

#techniqueTable th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #182f4e;
  color: white;
}

table,
th,
td {
  border: 2px solid black;
}


button {
  color: #000000;
  margin: 10px;
  border-radius: 5px;
  background-color: white;
  border: 1px solid #999;
  font-size: 14px;
  padding-right: 10px;
  padding-left: 10px;
  padding-top: 5px;
  padding-bottom: 5px;
  width: 120px;
  height: 45px;
  font-weight: bold;
}

button:hover {
background-color: #f0ebde;
}

h1 {
  text-align: center;
  display: block;
  font-size: 2em;
  margin-top: 0.67em;
  margin-bottom: 0.67em;
  margin-left: 0;
  margin-right: 0;
  font-weight: bold;
}

legend {
  font-weight: normal;
  text-align: justify;    
  text-justify: inter-word;
  text-align-last: left;
  font-family: Helvetica, Sans-Serif;
  font-size:18px; 
  color: #dbdbdb;
}

.multiselect {
  box-sizing: content-box;
  display: block;
  position: relative;
  width: 100%;
  min-height: 40px;
  text-align: left;
  color: #35495E;
}

.multiselect__tags {
  min-height: 40px;
  display: block;
  padding: 8px 40px 0 8px;
  border-radius: 5px;
  border: 1px solid #E8E8E8;
  background: rgb(46, 65, 88);
}

.multiselect__tag {
  position: relative;
  display: inline-block;
  padding: 4px 26px 4px 10px;
  border-radius: 5px;
  margin-right: 10px;
  color: #fff;
  line-height: 1;
  background: #5b6661;
  margin-bottom: 5px;
  white-space: nowrap;
  overflow: hidden;
  max-width: 100%;
  text-overflow: ellipsis;
}

.multiselect__tag-icon:after {
  content: "×";
  color: #216dcf;
  font-size: 14px;
}


.multiselect__content-wrapper {
  position: absolute;
  display: block;
  background: rgb(186, 185, 194);
  width: 100%;
  max-height: 240px;
  overflow: auto;
  border: 1px solid #E8E8E8;
  border-top: none;
  border-bottom-left-radius: 5px;
  border-bottom-right-radius: 5px;
  z-index: 50;
  -webkit-overflow-scrolling: touch;
}

.multiselect__option--highlight {
  background: #5c615f;
  outline: none;
  color: white;
}

.multiselect__option--highlight:after {
  content: attr(data-select);
  background: #02113a;
  color: rgb(61, 66, 133);
}

.multiselect__option--selected {
  background: #F3F3F3;
  color: #35495E;
  font-weight: bold;
}

.multiselect__option--selected:after {
  content: attr(data-selected);
  color: silver;
}

.multiselect__option--selected.multiselect__option--highlight {
  background: #6a79ff;
  color: rgb(7, 15, 54);
}

.multiselect__option--selected.multiselect__option--highlight:after {
  background: #4d77ad;
  content: attr(data-deselect);
  color: rgb(49, 139, 190);
}

.multiselect__placeholder {
  display: inline-block !important;
  margin-bottom: 0px !important;
  padding-top: 0px !important;
}

.multiselect.invalid .multiselect__tags {
  border: 1px solid #f86c6b !important;
}

.multiselect__option--highlight {
  background: #405568 !important;
}

.multiselect__option--highlight:after {
  background: #233647 !important;
}

.multiselect__tags {
  padding: 5px !important;
  min-height: 10px;
}

.multiselect__placeholder {
  margin-left: 10px;
  margin-top: 2px;
}

.multiselect__tag {
  background: #f0f0f0 !important;
  border: 1px solid rgba(60, 60, 60, 0.26) !important;
  color: black !important;
  margin-bottom: 0px !important;
  margin-right: 5px !important;
}

.multiselect__tag-icon:after {
  color: rgba(60, 60, 60, 0.5) !important;
}

.multiselect__tag-icon:focus,
.multiselect__tag-icon:hover {
  background: #f0f0f0 !important;
}

.multiselect__tag-icon:focus:after,
.multiselect__tag-icon:hover:after {
  color: red !important;
}

* {
  box-sizing: border-box;
}

/* Create three equal columns that floats next to each other */
.column {
  float: left;
  width: 33.33%;
  padding: 10px;
  height: 300px;
  /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

.close-icon {
  box-sizing: border-box;
  width: 20px;
  height: 20px;
  border-width: 3px;
  border-style: solid;
  border-color: red;
  background: -webkit-linear-gradient(-45deg, transparent 0%, transparent 46%, white 46%, white 56%, transparent 56%, transparent 100%), -webkit-linear-gradient(45deg, transparent 0%, transparent 46%, white 46%, white 56%, transparent 56%, transparent 100%);
  background-color: rgb(173, 132, 132);
  box-shadow: 0px 0px 5px 2px rgba(5, 5, 5, 0.5);
  transition: all 0.3s ease;
}


 @media only screen and (max-width: 800px) {

} 

</style>
/* word-wrap: break-word;   text-justify: distribute;   word-spacing:3px; /*

/* h1 {
  text-align: center;
  display: block;
  font-size: 3.4vw; 
  margin-top: 0.67em;
  margin-bottom: 0.67em;
  margin-left: 0;
  margin-right: 0;
  font-weight: bold;
}

legend {
  font-weight: normal;
  text-align: justify;
  word-wrap: break-word;
  text-justify: inter-word;
  text-justify: distribute;
  text-align-last: left;
  font-size: 2.3vw; 
  word-spacing:3px;
  color: #dbdbdb;
}
  button {
  width: 22%;
  height: auto;
  font-size: 2.5vw; 
  font-weight: bold;
} /*