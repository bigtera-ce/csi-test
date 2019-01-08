package apitest

import (
	"os"
	"testing"

	"github.com/kubernetes-csi/csi-test/pkg/sanity"
)

func TestMyDriver(t *testing.T) {
	config := &sanity.Config{
		TargetPath:                os.TempDir() + "/csi",
		StagingPath:               os.TempDir() + "/csi",
		Address:                   "/tmp/e2e-csi-sanity.sock",
		TestNodeVolumeAttachLimit: true,
	}

	sanity.Test(t, config)
}
